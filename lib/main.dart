import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/env.dart';
import 'services/firebase_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.load();
  await FirebaseInitializer.initialize();
  runApp(const ProviderScope(child: App()));
}
