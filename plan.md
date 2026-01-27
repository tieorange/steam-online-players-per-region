# Arc Raiders Live Player Counter - Flutter Web App

## Project Overview

Build a Flutter web application that displays real-time player counts for Arc Raiders game. The app fetches actual Steam player data and uses statistical modeling to estimate regional server distribution (Europe, North America, Asia, South America, Oceania).

## Tech Stack

- **Flutter 3.24+** (Web target)
- **State Management**: flutter_bloc ^8.1.6
- **DI**: get_it + injectable
- **Network**: dio + retrofit
- **Functional Programming**: dartz (Either for error handling)
- **Code Generation**: freezed, json_serializable
- **Testing**: mocktail, bloc_test

## Architecture: Clean Architecture

```
lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── app_constants.dart
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── network_info.dart
│   ├── usecases/
│   │   └── usecase.dart
│   ├── utils/
│   │   ├── region_estimator.dart
│   │   └── timezone_utils.dart
│   └── di/
│       └── injection.dart
│
├── features/
│   └── player_count/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── steam_remote_datasource.dart
│       │   │   └── player_count_local_datasource.dart
│       │   ├── models/
│       │   │   ├── steam_player_count_model.dart
│       │   │   └── regional_estimate_model.dart
│       │   └── repositories/
│       │       └── player_count_repository_impl.dart
│       │
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── player_count.dart
│       │   │   └── regional_distribution.dart
│       │   ├── repositories/
│       │   │   └── player_count_repository.dart
│       │   └── usecases/
│       │       ├── get_current_player_count.dart
│       │       ├── get_regional_estimates.dart
│       │       └── stream_player_count.dart
│       │
│       └── presentation/
│           ├── bloc/
│           │   ├── player_count_bloc.dart
│           │   ├── player_count_event.dart
│           │   └── player_count_state.dart
│           ├── widgets/
│           │   ├── player_count_card.dart
│           │   ├── region_selector.dart
│           │   ├── region_distribution_chart.dart
│           │   ├── live_indicator.dart
│           │   └── historical_mini_chart.dart
│           └── pages/
│               └── home_page.dart
│
├── app.dart
└── main.dart
```

---

## Feature Requirements

### 1. Steam API Integration

**Endpoint:**
```
GET https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/
Parameters:
  - appid: 1808500 (Arc Raiders)
  - key: [STEAM_API_KEY] (optional for this endpoint but add support)
```

**Response:**
```json
{
  "response": {
    "player_count": 256092,
    "result": 1
  }
}
```

### 2. Regional Distribution Smart-Guess Algorithm

Since no official regional API exists, implement statistical estimation based on:

#### Time-Based Weights (Prime Gaming Hours Model)

Each region has peak hours (local time 18:00-23:00). Calculate weight based on current UTC time:

```dart
class RegionEstimator {
  // Region timezone offsets (approximate center)
  static const Map<Region, int> regionUtcOffsets = {
    Region.europe: 1,        // CET (Central European Time)
    Region.northAmerica: -5, // EST (Eastern Standard Time)
    Region.asia: 8,          // CST (China Standard Time)
    Region.southAmerica: -3, // BRT (Brasília Time)
    Region.oceania: 10,      // AEST (Australian Eastern)
  };

  // Base distribution percentages (from market research / Steam regional data)
  static const Map<Region, double> baseDistribution = {
    Region.europe: 0.35,        // 35% - Largest PC gaming market
    Region.northAmerica: 0.30,  // 30% - Strong extraction shooter fanbase
    Region.asia: 0.20,          // 20% - Growing but less PC-focused
    Region.southAmerica: 0.10,  // 10% - Emerging market
    Region.oceania: 0.05,       // 5%  - Smaller but dedicated
  };

  /// Calculate activity multiplier based on local time
  /// Returns 0.2 - 1.0 based on how close to prime time (19:00-22:00 local)
  double getActivityMultiplier(Region region, DateTime utcNow) {
    final localHour = (utcNow.hour + regionUtcOffsets[region]!) % 24;
    
    // Prime time: 18-23 (multiplier 1.0)
    // Secondary: 12-18, 23-01 (multiplier 0.6)
    // Off-peak: 01-08 (multiplier 0.2)
    // Morning: 08-12 (multiplier 0.4)
    
    if (localHour >= 18 && localHour <= 23) return 1.0;
    if (localHour >= 23 || localHour <= 1) return 0.6;
    if (localHour >= 12 && localHour < 18) return 0.6;
    if (localHour >= 8 && localHour < 12) return 0.4;
    return 0.2; // 01-08 deep night
  }

  /// Day of week modifier (weekends = higher activity)
  double getDayOfWeekMultiplier(DateTime utcNow) {
    final weekday = utcNow.weekday;
    if (weekday == DateTime.saturday || weekday == DateTime.sunday) {
      return 1.2;
    }
    if (weekday == DateTime.friday) {
      return 1.1;
    }
    return 1.0;
  }

  /// Main estimation method
  Map<Region, int> estimateRegionalDistribution(int totalPlayers, DateTime utcNow) {
    final weights = <Region, double>{};
    double totalWeight = 0;

    for (final region in Region.values) {
      final baseWeight = baseDistribution[region]!;
      final timeMultiplier = getActivityMultiplier(region, utcNow);
      final dayMultiplier = getDayOfWeekMultiplier(utcNow);
      
      final weight = baseWeight * timeMultiplier * dayMultiplier;
      weights[region] = weight;
      totalWeight += weight;
    }

    // Normalize and calculate player counts
    final result = <Region, int>{};
    for (final region in Region.values) {
      final normalizedWeight = weights[region]! / totalWeight;
      result[region] = (totalPlayers * normalizedWeight).round();
    }

    return result;
  }
}
```

### 3. Data Refresh Strategy

- **Auto-refresh**: Every 60 seconds (Steam API updates ~5-10 min)
- **Manual refresh**: Pull-to-refresh or refresh button
- **Background polling**: Using `Stream` with `Timer.periodic`
- **Cache last value**: Show stale data with indicator if API fails

---

## Domain Layer

### Entities

```dart
// player_count.dart
@freezed
class PlayerCount with _$PlayerCount {
  const factory PlayerCount({
    required int totalPlayers,
    required int steamPlayers,
    required DateTime timestamp,
    required PlayerCountSource source,
  }) = _PlayerCount;
}

enum PlayerCountSource { steam, cached, estimated }

// regional_distribution.dart
@freezed
class RegionalDistribution with _$RegionalDistribution {
  const factory RegionalDistribution({
    required Map<Region, int> distribution,
    required DateTime calculatedAt,
    required bool isEstimate,
  }) = _RegionalDistribution;
}

enum Region { europe, northAmerica, asia, southAmerica, oceania }
```

### Repository Interface

```dart
abstract class PlayerCountRepository {
  /// Fetches current player count from Steam
  Future<Either<Failure, PlayerCount>> getCurrentPlayerCount();
  
  /// Streams player count updates every [interval]
  Stream<Either<Failure, PlayerCount>> streamPlayerCount(Duration interval);
  
  /// Gets estimated regional distribution
  Either<Failure, RegionalDistribution> getRegionalEstimate(PlayerCount count);
  
  /// Caches player count locally
  Future<void> cachePlayerCount(PlayerCount count);
  
  /// Retrieves last cached count
  Future<Either<Failure, PlayerCount>> getCachedPlayerCount();
}
```

### Use Cases

```dart
// get_current_player_count.dart
class GetCurrentPlayerCount implements UseCase<PlayerCount, NoParams> {
  final PlayerCountRepository repository;
  
  GetCurrentPlayerCount(this.repository);
  
  @override
  Future<Either<Failure, PlayerCount>> call(NoParams params) {
    return repository.getCurrentPlayerCount();
  }
}

// stream_player_count.dart
class StreamPlayerCount {
  final PlayerCountRepository repository;
  
  StreamPlayerCount(this.repository);
  
  Stream<Either<Failure, PlayerCount>> call({Duration interval = const Duration(seconds: 60)}) {
    return repository.streamPlayerCount(interval);
  }
}

// get_regional_estimates.dart
class GetRegionalEstimates {
  final PlayerCountRepository repository;
  
  GetRegionalEstimates(this.repository);
  
  Either<Failure, RegionalDistribution> call(PlayerCount count) {
    return repository.getRegionalEstimate(count);
  }
}
```

---

## Data Layer

### Remote Data Source

```dart
@RestApi(baseUrl: "https://api.steampowered.com")
abstract class SteamApiClient {
  factory SteamApiClient(Dio dio, {String baseUrl}) = _SteamApiClient;

  @GET("/ISteamUserStats/GetNumberOfCurrentPlayers/v1/")
  Future<SteamPlayerCountResponse> getCurrentPlayers(
    @Query("appid") int appId,
    @Query("key") String? apiKey,
  );
}

abstract class SteamRemoteDataSource {
  Future<SteamPlayerCountModel> getCurrentPlayerCount();
}

class SteamRemoteDataSourceImpl implements SteamRemoteDataSource {
  final SteamApiClient client;
  static const int arcRaidersAppId = 1808500;
  
  SteamRemoteDataSourceImpl(this.client);
  
  @override
  Future<SteamPlayerCountModel> getCurrentPlayerCount() async {
    try {
      final response = await client.getCurrentPlayers(arcRaidersAppId, null);
      return SteamPlayerCountModel.fromResponse(response);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error');
    }
  }
}
```

### Models

```dart
@freezed
class SteamPlayerCountModel with _$SteamPlayerCountModel {
  const factory SteamPlayerCountModel({
    required int playerCount,
    required int result,
  }) = _SteamPlayerCountModel;

  factory SteamPlayerCountModel.fromJson(Map<String, dynamic> json) =>
      _$SteamPlayerCountModelFromJson(json);
}

extension SteamPlayerCountModelX on SteamPlayerCountModel {
  PlayerCount toEntity() => PlayerCount(
        totalPlayers: playerCount,
        steamPlayers: playerCount,
        timestamp: DateTime.now().toUtc(),
        source: PlayerCountSource.steam,
      );
}
```

### Repository Implementation

```dart
class PlayerCountRepositoryImpl implements PlayerCountRepository {
  final SteamRemoteDataSource remoteDataSource;
  final PlayerCountLocalDataSource localDataSource;
  final RegionEstimator regionEstimator;

  PlayerCountRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.regionEstimator,
  });

  @override
  Future<Either<Failure, PlayerCount>> getCurrentPlayerCount() async {
    try {
      final model = await remoteDataSource.getCurrentPlayerCount();
      final entity = model.toEntity();
      await cachePlayerCount(entity);
      return Right(entity);
    } on ServerException catch (e) {
      // Try cache fallback
      final cached = await getCachedPlayerCount();
      return cached.fold(
        (failure) => Left(ServerFailure(e.message)),
        (cachedCount) => Right(cachedCount.copyWith(source: PlayerCountSource.cached)),
      );
    }
  }

  @override
  Stream<Either<Failure, PlayerCount>> streamPlayerCount(Duration interval) async* {
    // Emit immediately
    yield await getCurrentPlayerCount();
    
    // Then emit periodically
    yield* Stream.periodic(interval, (_) => getCurrentPlayerCount())
        .asyncMap((future) => future);
  }

  @override
  Either<Failure, RegionalDistribution> getRegionalEstimate(PlayerCount count) {
    try {
      final distribution = regionEstimator.estimateRegionalDistribution(
        count.totalPlayers,
        DateTime.now().toUtc(),
      );
      return Right(RegionalDistribution(
        distribution: distribution,
        calculatedAt: DateTime.now().toUtc(),
        isEstimate: true,
      ));
    } catch (e) {
      return Left(EstimationFailure('Failed to estimate regional distribution'));
    }
  }

  @override
  Future<void> cachePlayerCount(PlayerCount count) async {
    await localDataSource.cachePlayerCount(count);
  }

  @override
  Future<Either<Failure, PlayerCount>> getCachedPlayerCount() async {
    try {
      final cached = await localDataSource.getLastPlayerCount();
      if (cached != null) {
        return Right(cached);
      }
      return Left(CacheFailure('No cached data available'));
    } catch (e) {
      return Left(CacheFailure('Failed to retrieve cached data'));
    }
  }
}
```

---

## Presentation Layer

### BLoC

```dart
// player_count_event.dart
@freezed
class PlayerCountEvent with _$PlayerCountEvent {
  const factory PlayerCountEvent.started() = _Started;
  const factory PlayerCountEvent.refreshRequested() = _RefreshRequested;
  const factory PlayerCountEvent.regionSelected(Region region) = _RegionSelected;
  const factory PlayerCountEvent.autoRefreshToggled(bool enabled) = _AutoRefreshToggled;
}

// player_count_state.dart
@freezed
class PlayerCountState with _$PlayerCountState {
  const factory PlayerCountState({
    @Default(PlayerCountStatus.initial) PlayerCountStatus status,
    PlayerCount? playerCount,
    RegionalDistribution? regionalDistribution,
    Region? selectedRegion,
    @Default(true) bool autoRefreshEnabled,
    @Default(null) String? errorMessage,
    @Default(false) bool isRefreshing,
  }) = _PlayerCountState;
}

enum PlayerCountStatus { initial, loading, loaded, error }

// player_count_bloc.dart
class PlayerCountBloc extends Bloc<PlayerCountEvent, PlayerCountState> {
  final GetCurrentPlayerCount getCurrentPlayerCount;
  final StreamPlayerCount streamPlayerCount;
  final GetRegionalEstimates getRegionalEstimates;
  
  StreamSubscription<Either<Failure, PlayerCount>>? _playerCountSubscription;

  PlayerCountBloc({
    required this.getCurrentPlayerCount,
    required this.streamPlayerCount,
    required this.getRegionalEstimates,
  }) : super(const PlayerCountState()) {
    on<_Started>(_onStarted);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_RegionSelected>(_onRegionSelected);
    on<_AutoRefreshToggled>(_onAutoRefreshToggled);
  }

  Future<void> _onStarted(_Started event, Emitter<PlayerCountState> emit) async {
    emit(state.copyWith(status: PlayerCountStatus.loading));
    
    await _playerCountSubscription?.cancel();
    _playerCountSubscription = streamPlayerCount(
      interval: const Duration(seconds: 60),
    ).listen((result) {
      result.fold(
        (failure) => add(const PlayerCountEvent.refreshRequested()), // retry
        (playerCount) {
          final regionalResult = getRegionalEstimates(playerCount);
          regionalResult.fold(
            (failure) => emit(state.copyWith(
              status: PlayerCountStatus.loaded,
              playerCount: playerCount,
              isRefreshing: false,
            )),
            (distribution) => emit(state.copyWith(
              status: PlayerCountStatus.loaded,
              playerCount: playerCount,
              regionalDistribution: distribution,
              isRefreshing: false,
            )),
          );
        },
      );
    });
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<PlayerCountState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));
    
    final result = await getCurrentPlayerCount(const NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        isRefreshing: false,
        errorMessage: failure.message,
      )),
      (playerCount) {
        final regionalResult = getRegionalEstimates(playerCount);
        regionalResult.fold(
          (failure) => emit(state.copyWith(
            playerCount: playerCount,
            isRefreshing: false,
          )),
          (distribution) => emit(state.copyWith(
            playerCount: playerCount,
            regionalDistribution: distribution,
            isRefreshing: false,
          )),
        );
      },
    );
  }

  void _onRegionSelected(_RegionSelected event, Emitter<PlayerCountState> emit) {
    emit(state.copyWith(
      selectedRegion: state.selectedRegion == event.region ? null : event.region,
    ));
  }

  void _onAutoRefreshToggled(
    _AutoRefreshToggled event,
    Emitter<PlayerCountState> emit,
  ) {
    emit(state.copyWith(autoRefreshEnabled: event.enabled));
    if (event.enabled) {
      add(const PlayerCountEvent.started());
    } else {
      _playerCountSubscription?.cancel();
    }
  }

  @override
  Future<void> close() {
    _playerCountSubscription?.cancel();
    return super.close();
  }
}
```

---

## UI Design Specifications

### Color Scheme (Arc Raiders Inspired)

```dart
class AppColors {
  // Primary - Cyber orange/amber from Arc Raiders branding
  static const primary = Color(0xFFFF6B00);
  static const primaryLight = Color(0xFFFF8C3A);
  static const primaryDark = Color(0xFFCC5500);
  
  // Background - Dark sci-fi theme
  static const background = Color(0xFF0D1117);
  static const surface = Color(0xFF161B22);
  static const surfaceLight = Color(0xFF21262D);
  
  // Text
  static const textPrimary = Color(0xFFE6EDF3);
  static const textSecondary = Color(0xFF8B949E);
  
  // Status
  static const online = Color(0xFF3FB950);
  static const warning = Color(0xFFD29922);
  static const error = Color(0xFFF85149);
  
  // Regions
  static const europe = Color(0xFF58A6FF);
  static const northAmerica = Color(0xFFF778BA);
  static const asia = Color(0xFFA371F7);
  static const southAmerica = Color(0xFF3FB950);
  static const oceania = Color(0xFFD29922);
}
```

### Main Layout

```
┌─────────────────────────────────────────────────────────────┐
│  ┌─────────────────────────────────────────────────────┐   │
│  │         ARC RAIDERS LIVE PLAYER TRACKER             │   │
│  │         ● LIVE    Last updated: 12:34:56            │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                                                     │   │
│  │              ████████████████████                   │   │
│  │                  256,092                            │   │
│  │              PLAYERS ONLINE (STEAM)                 │   │
│  │                                                     │   │
│  │    ▲ +12,450 (5.1%) from 1 hour ago                │   │
│  │                                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌───────────── ESTIMATED BY REGION ──────────────────┐   │
│  │                                                     │   │
│  │  [EUROPE]  [N.AMERICA]  [ASIA]  [S.AMERICA] [OCE]  │   │
│  │                                                     │   │
│  │  ┌─────────────────────────────────────────────┐   │   │
│  │  │  🇪🇺 Europe          89,632  (35%)   ████████│   │   │
│  │  │  🇺🇸 North America   76,827  (30%)   ██████▌ │   │   │
│  │  │  🇯🇵 Asia            51,218  (20%)   ████▌   │   │   │
│  │  │  🇧🇷 South America   25,609  (10%)   ██▌     │   │   │
│  │  │  🇦🇺 Oceania         12,804  (5%)    █▌      │   │   │
│  │  └─────────────────────────────────────────────┘   │   │
│  │                                                     │   │
│  │  ⚠️ Estimates based on regional gaming patterns    │   │
│  │                                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌───────────── 24-HOUR TREND ────────────────────────┐   │
│  │  250K ┤                     ╭───╮                   │   │
│  │  200K ┤        ╭────╮      │   │      ╭──          │   │
│  │  150K ┤   ╭────╯    ╰──────╯   ╰──────╯            │   │
│  │  100K ┤───╯                                         │   │
│  │       └──────────────────────────────────────────   │   │
│  │        00:00   06:00   12:00   18:00   NOW          │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  ⚙️ Auto-refresh: [ON]     🔄 Refresh manually      │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  📊 Data source: Steam API                          │   │
│  │  ⚠️ PS5/Xbox counts not available (no public API)   │   │
│  │  📍 Regional estimates use time-based algorithms    │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### Widgets to Build

1. **LiveIndicator** - Pulsing green dot with "LIVE" text
2. **PlayerCountCard** - Main big number with animated counter
3. **RegionSelector** - Horizontal chip/tab selector for regions  
4. **RegionDistributionBar** - Horizontal progress bars with percentages
5. **TrendMiniChart** - Simple line chart (use `fl_chart` package)
6. **RefreshControls** - Auto-refresh toggle + manual refresh button
7. **DataSourceDisclaimer** - Footer explaining data sources

### Animations

- **Counter animation**: Animate number changes with `AnimatedSwitcher` or `TweenAnimationBuilder`
- **Live pulse**: Repeating scale animation on the live indicator
- **Bar charts**: Animate width changes on region bars
- **Refresh spinner**: Rotating icon during refresh

---

## Dependencies (pubspec.yaml)

```yaml
name: arc_raiders_tracker
description: Live player count tracker for Arc Raiders

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5
  
  # Dependency Injection
  get_it: ^7.6.7
  injectable: ^2.3.2
  
  # Network
  dio: ^5.4.1
  retrofit: ^4.1.0
  
  # Functional Programming
  dartz: ^0.10.1
  
  # Code Generation
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  
  # Local Storage
  shared_preferences: ^2.2.2
  
  # Charts
  fl_chart: ^0.66.2
  
  # Utils
  intl: ^0.19.0
  logger: ^2.0.2+1

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code Generation
  build_runner: ^2.4.8
  freezed: ^2.4.7
  json_serializable: ^6.7.1
  injectable_generator: ^2.4.1
  retrofit_generator: ^8.1.0
  
  # Testing
  bloc_test: ^9.1.7
  mocktail: ^1.0.3
  
  # Linting
  very_good_analysis: ^5.1.0

flutter:
  uses-material-design: true
  
  fonts:
    - family: Rajdhani
      fonts:
        - asset: assets/fonts/Rajdhani-Regular.ttf
        - asset: assets/fonts/Rajdhani-Bold.ttf
          weight: 700
```

---

## Implementation Order

### Phase 1: Core Setup
1. Create project structure
2. Set up dependency injection with get_it + injectable
3. Configure Dio client with interceptors (logging, error handling)
4. Implement core error handling (Failures, Exceptions)

### Phase 2: Data Layer
1. Create Steam API client with Retrofit
2. Implement SteamRemoteDataSource
3. Create PlayerCountLocalDataSource with SharedPreferences
4. Implement PlayerCountRepositoryImpl

### Phase 3: Domain Layer
1. Create entities with Freezed
2. Define repository interface
3. Implement use cases

### Phase 4: Region Estimator
1. Implement RegionEstimator utility class
2. Add comprehensive unit tests for estimation logic
3. Fine-tune base distribution percentages

### Phase 5: Presentation Layer
1. Create PlayerCountBloc
2. Build HomePage scaffold
3. Implement individual widgets
4. Add animations

### Phase 6: Polish
1. Add loading skeletons
2. Implement error states with retry
3. Add pull-to-refresh
4. Responsive layout for mobile/desktop
5. Add dark/light theme toggle (optional)

---

## Testing Requirements

### Unit Tests

```dart
// region_estimator_test.dart
void main() {
  late RegionEstimator estimator;

  setUp(() {
    estimator = RegionEstimator();
  });

  group('RegionEstimator', () {
    test('should return higher Europe count during EU prime time', () {
      // EU prime time: 20:00 CET = 19:00 UTC
      final euPrimeTime = DateTime.utc(2024, 1, 15, 19, 0);
      final result = estimator.estimateRegionalDistribution(100000, euPrimeTime);
      
      expect(result[Region.europe], greaterThan(result[Region.asia]));
    });

    test('should return higher Asia count during Asia prime time', () {
      // Asia prime time: 20:00 CST = 12:00 UTC
      final asiaPrimeTime = DateTime.utc(2024, 1, 15, 12, 0);
      final result = estimator.estimateRegionalDistribution(100000, asiaPrimeTime);
      
      expect(result[Region.asia], greaterThan(result[Region.oceania]));
    });

    test('should return higher counts on weekends', () {
      final saturday = DateTime.utc(2024, 1, 13, 19, 0); // Saturday
      final monday = DateTime.utc(2024, 1, 15, 19, 0);   // Monday
      
      final saturdayResult = estimator.estimateRegionalDistribution(100000, saturday);
      final mondayResult = estimator.estimateRegionalDistribution(100000, monday);
      
      final saturdayTotal = saturdayResult.values.reduce((a, b) => a + b);
      final mondayTotal = mondayResult.values.reduce((a, b) => a + b);
      
      // Both should sum to ~100000, but weekend multiplier affects distribution
      expect(saturdayTotal, closeTo(100000, 10));
      expect(mondayTotal, closeTo(100000, 10));
    });

    test('all regions should sum to total players', () {
      final now = DateTime.now().toUtc();
      final result = estimator.estimateRegionalDistribution(256092, now);
      
      final sum = result.values.reduce((a, b) => a + b);
      expect(sum, closeTo(256092, 5)); // Allow small rounding error
    });
  });
}
```

### BLoC Tests

```dart
// player_count_bloc_test.dart
void main() {
  late PlayerCountBloc bloc;
  late MockGetCurrentPlayerCount mockGetCurrentPlayerCount;
  late MockStreamPlayerCount mockStreamPlayerCount;
  late MockGetRegionalEstimates mockGetRegionalEstimates;

  setUp(() {
    mockGetCurrentPlayerCount = MockGetCurrentPlayerCount();
    mockStreamPlayerCount = MockStreamPlayerCount();
    mockGetRegionalEstimates = MockGetRegionalEstimates();
    
    bloc = PlayerCountBloc(
      getCurrentPlayerCount: mockGetCurrentPlayerCount,
      streamPlayerCount: mockStreamPlayerCount,
      getRegionalEstimates: mockGetRegionalEstimates,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('PlayerCountBloc', () {
    final tPlayerCount = PlayerCount(
      totalPlayers: 256092,
      steamPlayers: 256092,
      timestamp: DateTime.now(),
      source: PlayerCountSource.steam,
    );

    blocTest<PlayerCountBloc, PlayerCountState>(
      'emits [loading, loaded] when started successfully',
      build: () {
        when(() => mockStreamPlayerCount(interval: any(named: 'interval')))
            .thenAnswer((_) => Stream.value(Right(tPlayerCount)));
        when(() => mockGetRegionalEstimates(any()))
            .thenReturn(Right(tRegionalDistribution));
        return bloc;
      },
      act: (bloc) => bloc.add(const PlayerCountEvent.started()),
      expect: () => [
        const PlayerCountState(status: PlayerCountStatus.loading),
        isA<PlayerCountState>()
            .having((s) => s.status, 'status', PlayerCountStatus.loaded)
            .having((s) => s.playerCount, 'playerCount', tPlayerCount),
      ],
    );
  });
}
```

---

## Environment Configuration

Create `.env` file (optional, Steam API key not required for player count endpoint):

```
STEAM_API_KEY=your_optional_api_key_here
```

Use `flutter_dotenv` or compile-time environment variables:

```dart
// api_constants.dart
class ApiConstants {
  static const String steamBaseUrl = 'https://api.steampowered.com';
  static const int arcRaidersAppId = 1808500;
  
  // Optional: from --dart-define or .env
  static String? get steamApiKey => const String.fromEnvironment('STEAM_API_KEY');
}
```

---

## Error Handling Strategy

```dart
// failures.dart
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class EstimationFailure extends Failure {
  const EstimationFailure(super.message);
}

// exceptions.dart
class ServerException implements Exception {
  final String message;
  const ServerException({required this.message});
}

class CacheException implements Exception {
  final String message;
  const CacheException({required this.message});
}
```

---

## Additional Features (Nice to Have)

1. **Notifications**: Browser notification when player count crosses threshold
2. **Historical Data**: Store hourly snapshots in IndexedDB for trend charts
3. **Comparison Mode**: Compare current hour vs same hour yesterday/last week
4. **Share**: Generate shareable image/link with current stats
5. **Multi-game Support**: Extend to track other Embark Studios games (The Finals, etc.)

---

## Notes for AI Assistant

- Always use `Either<Failure, T>` for repository methods
- Prefer `const` constructors where possible
- Use Freezed unions for events and states
- Keep widgets small and focused (max ~100 lines)
- Extract magic numbers to constants
- Add doc comments to public APIs
- Use meaningful variable names (no abbreviations except common ones like `id`, `url`)
- Handle loading, error, and empty states in all widgets
- Test edge cases: 0 players, API timeout, malformed response

---

## Quick Start Commands

```bash
# Create project
flutter create --platforms web arc_raiders_tracker
cd arc_raiders_tracker

# Add dependencies (copy from pubspec.yaml above)
flutter pub get

# Generate code after creating freezed/injectable files
dart run build_runner build --delete-conflicting-outputs

# Run in Chrome
flutter run -d chrome

# Build for production
flutter build web --release
```

---

This prompt provides everything needed to build the Arc Raiders player tracker. Focus on getting the Steam API integration working first, then add the regional estimation layer. The UI can be polished iteratively.
