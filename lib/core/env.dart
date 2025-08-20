import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get projectId => dotenv.env['FIREBASE_PROJECT_ID'] ?? '';
  static String get projectNumber => dotenv.env['FIREBASE_PROJECT_NUMBER'] ?? '';
  static String get webApiKey => dotenv.env['FIREBASE_WEB_API_KEY'] ?? '';

  static Future<void> load() async {
    await dotenv.load();
  }
}
