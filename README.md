# 🎮 Arc Raiders Tracker

> **Live Global Player Counter & Region Estimator for Steam**
> [Live Demo](https://tieorange-arc-tracker.vercel.app)

![Main Screenshot](https://via.placeholder.com/800x400?text=App+Screenshot+Placeholder)

A modern, clean-architecture Flutter Web application aimed at providing real-time player statistics and regional distribution estimates for *Arc Raiders*.

## ✨ Features

- 🌍 **Live Player Count**: Real-time data fetching from Steam API.
- 📊 **Regional Estimates**: Smart algorithms to estimate player distribution across EU, NA, and Asia.
- ⚡️ **Clean Architecture**: Built with separation of concerns, scalability, and maintainability in mind.
- 🎭 **Strict Typing**: Leveraging Dart 3 `sealed classes` and functional programming principles.
- 🚀 **Serverless Proxy**: Secure CORS handling via Vercel Edge Functions.

## 🛠 Tech Stack

| Category | Technology |
|----------|------------|
| **Framework** | Flutter Web 💙 |
| **Language** | Dart 3 🎯 |
| **State** | BLoC (v8) 🧊 |
| **Network** | Dio + Retrofit 🌐 |
| **DI** | GetIt + Injectable 💉 |
| **Hosting** | Vercel ▲ |

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.22+)
- [Node.js](https://nodejs.org/) (for Vercel CLI)

### 🏃‍♂️ Run Locally

1. **Clone the repository**:
   ```bash
   git clone https://github.com/tieorange/steam-online-players-per-region.git
   cd steam-online-players-per-region
   ```

2. **Install Dependencies**:
   ```bash
   make get
   ```

3. **Generate Code** (Freezed/JsonSerializable):
   ```bash
   make gen
   ```

4. **Run the App**:
   ```bash
   make run
   ```
   *Note: Local development uses `corsproxy.io` automatically.*

## 📦 Building & Deployment

We use **Vercel** for deployment. The project includes a `Makefile` to streamline the process.

### Manual Deployment

1. **Build the Web App**:
   ```bash
   make build-web
   ```
   *Compiles the app to `build/web`.*

2. **Deploy to Vercel**:
   ```bash
   make deploy-web
   ```
   *Uploads the build artifacts and serverless functions to Vercel.*

For detailed architectural guidelines and strict coding standards, please refer to [Agents.md](./Agents.md).

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
Made with ❤️ by **TieOrange** & **Antigravity Agents**
