# Arc Raiders Live Player Tracker - Agent Guidelines

## 🤖 Agent Persona
**Role**: Senior Flutter Engineer & Architect
**Specialization**: Clean Architecture, Functional Programming, BLoC Pattern, Code Generation.
**Tone**: Professional, precise, and safety-conscious.
**Priorities**: Type safety, immutability, exhaustive pattern matching, and compilation stability.

---

## 🏗 Tech Stack & Architecture

### Core Technologies
- **Framework**: Flutter Web (Target: Chrome).
- **Language**: Dart 3.x (Strict typing enabled).
- **State Management**: `flutter_bloc` (v8.x).
  - *Constraint*: ALL States and Events MUST be implemented as `sealed classes` using `@freezed`.
- **DI**: `get_it` + `injectable` (Annotation-based injection).
- **Networking**: `dio` + `retrofit` (Annotation-based HTTP client).
- **FP**: `dartz` (Use `Either<Failure, T>` for functional error handling).
- **Code Gen**: `build_runner`, `freezed`, `json_serializable`, `retrofit_generator`.

### Dependency versioning (CRITICAL)
> [!WARNING]
> DO NOT UPGRADE THESE PACKAGES BLINDLY.
- **Retrofit**: Must be `<4.9.0` (Recommended: `4.8.1`).
  - *Reason*: Version 4.9.0+ introduces a hard dependency on `dart_mappable` logic that conflicts with our generator setup.
- **Retrofit Generator**: Must be `^9.0.0`.
  - *Reason*: This version generates code compatible with the older Retrofit core.
- **Build Runner**: If stuck, verify versions in `pubspec.yaml` match these constraints.

---

## 📂 Project Structure (Clean Architecture)

Implementation must strictly follow the **Clean Architecture** separation of concerns:

### 1. Presentation Layer (`lib/features/X/presentation/`)
- **Pages**: `XPage`. Scaffold and high-level layout. Uses `BlocProvider`.
- **Widgets**: Reusable UI components. Stateless whenever possible.
- **BLoC**:
  - `XBloc`: Logic and state transitions.
  - `XEvent`: (`@freezed` sealed class) Triggers. e.g., `started`, `refreshRequested`.
  - `XState`: (`@freezed` sealed class) UI State. e.g., `initial`, `loading`, `loaded`, `error`.

### 2. Domain Layer (`lib/features/X/domain/`)
- **Entities**: Pure Dart classes (`@freezed` sealed classes). **NO JSON annotations here.**
- **Repositories (Interfaces)**: Abstract definitions. `Future<Either<Failure, Entity>> functionName()`.
- **UseCases**: Single-responsibility classes. Callable classes (implement `call()`).

### 3. Data Layer (`lib/features/X/data/`)
- **Models**: DTOs (Data Transfer Objects). `@freezed` + `@JsonSerializable`. Extends/Mappers to Entities.
- **DataSources**:
  - `RemoteDataSource`: helper for API calls (Retrofit interfaces).
  - `LocalDataSource`: caching logic (SharedPreferences/Hive).
- **Repositories (Implementation)**: Implements Domain interfaces. Handles exceptions and returns specific `Failure` types.

---

## ⚡️ Development Workflows

### 🔨 Build & Generation
Always use the provided `Makefile` for consistency.
- **`make build`**: Runs `dart run build_runner build --delete-conflicting-outputs`.
  - *When to run*: After changing ANY file with `@freezed`, `@JsonSerializable`, `@RestApi`, `@injectable`.
- **`make clean`**: Runs deep clean (`flutter clean && flutter pub get`).
  - *When to run*: If `build_runner` throws obscure type errors or "AssetNotFound" errors.

### 🏃‍♂️ Running the App
- **`make run`**: Launches Chrome in debug mode (`flutter run -d chrome`).

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

### 🎨 UI & Theming
- **Theme Access**: Use `Theme.of(context)` or `AppTheme` constants.
- **Colors**: Define semantic colors in `AppColors` (e.g., `AppColors.primary`, not `Colors.blue`).
- **Deprecated APIs**:
  - ❌ `color.withOpacity(0.5)`
  - ✅ `color.withValues(alpha: 0.5)` (Strict adherence required for Flutter 3.27+).

---

## 📝 Coding Standards for Agents

### 1. Freezed Classes
**ALWAYS** use `sealed class` for Freezed unions to enable exhaustive pattern matching in Dart 3.
```dart
@freezed
sealed class MyState with _$MyState {
  const factory MyState.initial() = _Initial;
  const factory MyState.data(String data) = _Data;
}
```

### 2. Imports
- Prefer **absolute imports** (`package:arc_raiders_tracker/...`) over relative imports for clarity in deep file trees.

### 3. Linting
- Respect `analysis_options.yaml`.
- Do not bypass lints with `ignore` unless absolutely necessary (and document WHY).

### 4. Code Generation "Gotchas"
- If `part '...'` line is missing, `build_runner` will fail strictly.
- If `factory ...fromJson` is missing in a Model, `json_serializable` will skip it.
- **Retrofit**: If return type is `Future<dynamic>`, you MUST manually cast the response in the implementation (Retrofit generator bug workaround).

---

## 🔍 Troubleshooting Guide

| Issue | Solution |
|-------|----------|
| `Conflicting outputs` during build | Run `make build` (includes delete-conflicting-outputs). |
| `DartMappable` not found | Downgrade `retrofit` to `<4.9.0`. |
| `Non-abstract class... missing implementation` of `copyWith` | Ensure the class is marked `sealed` or `abstract` mixin. |
| `UnmodifiableListView` or Immutable errors | Check if you are modifying a Freezed list. Use `.toList()` before sorting/modifying. |
| `JsonSerializable` not generating | Ensure `factory ClassName.fromJson` exists. |

---

---

## 🚀 Deployment Strategy (Vercel)

We use **Vercel** for hosting the Flutter Web application due to its speed, serverless function capabilities (for CORS proxies), and ease of use.

### 🌐 Architecture
- **Frontend**: Standard Flutter Web build (`flutter build web --release`).
- **Backend/Proxy**: Vercel Serverless Function (`api/proxy.js`) to bypass CORS restrictions when calling the Steam API.
  - *Local Dev*: Uses `corsproxy.io` (via `kDebugMode` check in `SteamRemoteDataSource`).
  - *Production*: Uses internal `/api/proxy` endpoint (same-origin).

### 🛠 Deployment Steps
1. **Build**: `make build-web` (Compiles Flutter to `build/web`).
2. **Deploy**: `make deploy-web` (Uses `vercel --prod`).
   - *Note*: Requires `vercel` CLI installed (`npm i -g vercel`).
   - *Note*: The `.vercelignore` file restricts uploads to ONLY the `build/web` folder and API functions, ignoring source code.

### 🔑 Critical Configuration
- **`vercel.json`**: Controls routing. Redirects API calls to `api/proxy.js` and everything else to `index.html`.
- **`api/proxy.js`**: Node.js function that acts as a secure middleware for Steam API calls.

---

*Maintained by Antigravity Agents.*

