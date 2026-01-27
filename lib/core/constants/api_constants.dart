class ApiConstants {
  static const String steamBaseUrl = 'https://api.steampowered.com';
  static const int arcRaidersAppId = 1808500;

  // Optional: from --dart-define or .env
  // For this specific endpoint (GetNumberOfCurrentPlayers), API Key is NOT required.
  // But we keep this here if we need to extend to other endpoints later.
  static const String? steamApiKey = String.fromEnvironment('STEAM_API_KEY');
}
