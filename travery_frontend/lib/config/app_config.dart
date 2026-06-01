import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const int timeout = 10000;

  // Thay từ String.fromEnvironment() → dotenv
  static String get baseUrl {
    final url = dotenv.env['BASE_URL'];
    if (url == null || url.isEmpty) {
      throw Exception('BASE_URL not found');
    }
    String host = url;
    if (host.startsWith('https://')) {
      host = host.substring(8);
    } else if (host.startsWith('http://')) {
      host = host.substring(7);
    }
    return host;
  }

  static String get cometChatAuthKey {
    final key = dotenv.env['COMETCHAT_AUTH_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('COMETCHAT_AUTH_KEY not found');
    }
    return key;
  }

  static String get cometChatAppId {
    final id = dotenv.env['COMETCHAT_APP_ID'];
    if (id == null || id.isEmpty) {
      throw Exception('COMETCHAT_APP_ID not found');
    }
    return id;
  }

  /// CometChat Region
  static String get cometChatRegion => dotenv.env['COMETCHAT_REGION'] ?? 'in';
}
