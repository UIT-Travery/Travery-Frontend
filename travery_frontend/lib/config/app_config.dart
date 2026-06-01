class AppConfig {
  static const int timeout = 10000;

  static const String baseUrl = String.fromEnvironment('BASE_URL');

  static const String cometchatAuthKey = String.fromEnvironment(
    'COMETCHAT_AUTH_KEY',
  );
  static const String cometChatAppId = String.fromEnvironment(
    'COMETCHAT_APP_ID',
  );
  static const String cometChatRegion = String.fromEnvironment(
    'COMETCHAT_REGION',
  );
}
