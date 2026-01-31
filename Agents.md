# Arc Raiders Live Player Tracker - Agent Guidelines

## 🤖 Agent Persona
**Role**: Senior Flutter Engineer & Architect
**Specialization**: Clean Architecture, Functional Programming, BLoC Pattern, Code Generation.
**Tone**: Professional, precise, and safety-conscious.
**Priorities**: Type safety, immutability, exhaustive pattern matching, and compilation stability.

---

## 🏗 Tech Stack & Architecture

### Core Technologies
- **Framework**: Flutter Web (Target: Chrome, WASM-enabled).
- **Language**: Dart 3.x (Strict typing enabled).
- **State Management**: `flutter_bloc` (v8.x).
  - *Constraint*: ALL States and Events MUST be implemented as `sealed classes` using `@freezed`.
- **DI**: `get_it` + `injectable` (Annotation-based injection).
- **Networking**: `dio` + `retrofit` (Annotation-based HTTP client).
- **FP**: `dartz` (Use `Either<Failure, T>` for functional error handling).
- **Code Gen**: `build_runner`, `freezed`, `json_serializable`, `retrofit_generator`.
- **Charts**: `fl_chart` (v0.66.x) for player distribution visualizations.
- **Fonts**: `google_fonts` with locally bundled fonts for performance.

### Dependency Versioning (CRITICAL)
> [!WARNING]
> DO NOT UPGRADE THESE PACKAGES BLINDLY.
- **Retrofit**: Must be `<4.9.0` (Recommended: `>=4.0.0 <4.9.0`).
  - *Reason*: Version 4.9.0+ introduces a hard dependency on `dart_mappable` logic that conflicts with our generator setup.
- **Retrofit Generator**: Must be `^9.0.0`.
  - *Reason*: This version generates code compatible with the older Retrofit core.
- **Build Runner**: If stuck, verify versions in `pubspec.yaml` match these constraints.

---

## 📂 Project Structure (Clean Architecture)

### Core Module (`lib/core/`)
Shared infrastructure used across all features:

| Directory | Purpose |
|-----------|---------|
| `constants/` | App-wide constants, `GameRegistry` (game definitions) |
| `di/` | `get_it` + `injectable` setup (`injection.dart`, generated `injection.config.dart`) |
| `entities/` | Shared domain entities (e.g., `Game`) |
| `error/` | `Exceptions` (thrown in data layer) and `Failures` (returned in domain layer) |
| `network/` | `Dio` client configuration module |
| `theme/` | `AppTheme`, `AppColors`, `ThemeCubit` |
| `usecases/` | Base `UseCase<Type, Params>` class |
| `utils/` | Utilities (e.g., `RegionEstimator`) |

### Feature Module (`lib/features/player_count/`)

#### 1. Presentation Layer (`presentation/`)
- **Pages**: `HomePage`. Scaffold and high-level layout. Uses `BlocProvider`.
- **Widgets**: Reusable UI components (`/widgets/`). Stateless whenever possible.
- **BLoC**:
  - `PlayerCountBloc`: Logic and state transitions.
  - `PlayerCountEvent`: (`@freezed` sealed class) Triggers.
  - `PlayerCountState`: (`@freezed` sealed class) UI State.
  - `GameSelectorCubit`: Manages currently selected game tab.
  - `NewsCubit`, `AchievementsCubit`: Secondary data cubits.

#### 2. Domain Layer (`domain/`)
- **Entities**: Pure Dart classes (`@freezed`). **NO JSON annotations here.**
- **Repositories (Interfaces)**: Abstract definitions. `Future<Either<Failure, Entity>> functionName()`.
- **UseCases**: Single-responsibility callable classes.
- **Services**: Domain logic (e.g., `PingEstimator`, `PeakTimeCalculator`).

#### 3. Data Layer (`data/`)
- **Models**: DTOs with `@freezed` + `@JsonSerializable`. Map to/from Entities.
- **DataSources**:
  - `SteamRemoteDataSource`: Retrofit API interface.
  - `PlayerCountLocalDataSource`: SharedPreferences caching via `PrefsWrapper`.
- **Repositories (Implementation)**: Implements Domain interfaces.

---

## ⚡️ Development Workflows

### 🔨 Makefile Commands (Complete List)

| Command | Description |
|---------|-------------|
| `make clean` | Runs `flutter clean` |
| `make get` | Runs `flutter pub get` |
| `make gen` | Runs `build_runner build --delete-conflicting-outputs` |
| `make watch` | Runs `build_runner watch` (continuous code gen) |
| `make format` | Runs `dart format lib test` |
| `make analyze` | Runs `flutter analyze` |
| `make fix` | Runs `dart fix --apply` |
| `make run` | Runs app in Chrome (`flutter run -d chrome`) |
| `make run-macos` | Runs app on macOS desktop |
| `make test` | Runs `flutter test` |
| `make build-web` | Standard release build |
| `make build-web-optimized` | **Production build** with WASM + PWA (`--wasm --pwa-strategy=offline-first`) |
| `make deploy-web` | Deploys to Vercel (`npx vercel --prod`) |

> [!TIP]
> **When to run `make gen`**: After changing ANY file with `@freezed`, `@JsonSerializable`, `@RestApi`, `@injectable`, or `@lazySingleton`.

### 🐛 Error Handling Strategy (Strict)
1. **Exceptions vs Failures**:
   - **Throw Exceptions** only in *Data Sources* (e.g., `ServerException`).
   - **Return Failures** in *Repositories* (e.g., `Left(ServerFailure())`).
2. **Result Types**:
   - Use `Either<Failure, SuccessType>` for all Repository & UseCase return types.
3. **BLoC Handling**:
   ```dart
   final result = await useCase(NoParams());
   result.fold(
     (failure) => emit(State.error(failure)),
     (data) => emit(State.loaded(data)),
   );
   ```

---

## 🎮 Multi-Game Support

The app supports multiple Steam games via `GameRegistry`:

```dart
// lib/core/constants/game_registry.dart
class GameRegistry {
  static const Game arcRaiders = Game(appId: 1808500, name: 'Arc Raiders', shortName: 'ARC');
  static const Game battlefield6 = Game(appId: 2807960, name: 'Battlefield 6', shortName: 'BF6');
  static List<Game> get all => [arcRaiders, battlefield6];
  static Game get defaultGame => arcRaiders;
}
```

**To add a new game**:
1. Add a new `Game` constant in `GameRegistry`.
2. Add it to the `all` list.
3. The UI (`GameTabBar`) will automatically display the new tab.

---

## 🚀 Performance Optimizations

### Font Bundling
Fonts are locally bundled in `assets/fonts/` to eliminate network loading:
- **Orbitron** (500, 600, 700, 900) - Headings
- **Barlow** (400, 500, 600, 700) - Body text
- **JetBrains Mono** (400, 500) - Monospace/HUD elements

> The `google_fonts` package automatically detects and uses bundled fonts matching the family name.

### Non-Blocking DI (PrefsWrapper Pattern)
SharedPreferences is loaded asynchronously to avoid blocking app startup:

```dart
// lib/features/player_count/data/datasources/player_count_local_datasource.dart
@lazySingleton
class PrefsWrapper {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
}

// Usage in data source
final prefs = await _prefsWrapper.prefs;
```

> [!IMPORTANT]
> Do NOT use `@preResolve` for SharedPreferences. It blocks the main thread during DI initialization.

### CRT Overlay Optimization
The CRT flicker animation is **disabled on web** by default for performance:
```dart
this.enableFlicker = !kIsWeb,  // in crt_overlay.dart
```

### Script Loading
`index.html` uses `defer` for Flutter bootstrap to allow HTML parsing before script execution.

---

## 🎨 UI & Theming

### Theme Access
- Use `Theme.of(context)` or `AppTheme` constants.
- Colors: Use semantic colors in `AppColors` (e.g., `AppColors.primary`, not `Colors.blue`).

### Color API (Flutter 3.27+)
> [!WARNING]
> **Deprecated APIs**:
> - ❌ `color.withOpacity(0.5)`
> - ✅ `color.withValues(alpha: 0.5)`

### Platform Checks
Use `kIsWeb` from `package:flutter/foundation.dart` for web-specific behavior:
```dart
import 'package:flutter/foundation.dart';
if (kIsWeb) {
  // Web-specific logic
}
```

---

## 📝 Coding Standards

### 1. Freezed Classes
**ALWAYS** use `sealed class` for Freezed unions:
```dart
@freezed
sealed class MyState with _$MyState {
  const factory MyState.initial() = _Initial;
  const factory MyState.data(String data) = _Data;
}
```

### 2. Imports
- Prefer **absolute imports** (`package:arc_raiders_tracker/...`) over relative imports.

### 3. Linting
- Respect `analysis_options.yaml` (uses `very_good_analysis`).
- Do not bypass lints with `ignore` unless absolutely necessary.

### 4. Const Constructors
- Use `const` constructors for static widgets to enable widget caching.
- Mark widget constructors as `const` when all fields are final and compile-time constants.

---

## 🔍 Troubleshooting Guide

| Issue | Solution |
|-------|----------|
| `Conflicting outputs` during build | Run `make gen` (includes `--delete-conflicting-outputs`). |
| `DartMappable` not found | Downgrade `retrofit` to `<4.9.0`. |
| `Non-abstract class... missing implementation` of `copyWith` | Ensure the class is marked `sealed` or uses `abstract mixin`. |
| `UnmodifiableListView` or Immutable errors | Use `.toList()` before sorting/modifying Freezed lists. |
| `JsonSerializable` not generating | Ensure `factory ClassName.fromJson` exists. |
| `JsonKey` warnings on constructors | `@JsonKey` can only be used on fields/getters, not constructor parameters. |
| Fonts not loading | Verify `assets/fonts/` is registered in `pubspec.yaml`. |
| App startup blocked | Check for `@preResolve` annotations in DI modules. Use `PrefsWrapper` pattern. |
| CORS errors in production | Ensure API calls use `/api/proxy` endpoint (same-origin). |

---

## 🚀 Deployment Strategy (Vercel)

### Architecture
- **Frontend**: Flutter Web build with WASM support (`build/web/`).
- **Backend/Proxy**: Vercel Serverless Function (`api/proxy.js`) for CORS-free Steam API access.
  - *Local Dev*: Uses `corsproxy.io` (via `kDebugMode` check).
  - *Production*: Uses internal `/api/proxy` endpoint (same-origin).

### Deployment Steps
1. **Build**: `make build-web-optimized` (Compiles with WASM + PWA).
2. **Deploy**: `make deploy-web` (Uses `npx vercel --prod`).
   - Requires `vercel` CLI: `npm i -g vercel`.

### Critical Configuration

#### `vercel.json`
- Routes API calls to `api/proxy.js`.
- Serves static files from `build/web/`.
- **Cache headers**: Assets and JS files cached for 1 year (`max-age=31536000, immutable`).

#### `.vercelignore`
Restricts uploads to only `build/web/` and `api/` folders.

---

*Maintained by Antigravity Agents. Last updated: 2026-01-30.*
