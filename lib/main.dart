import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_sample/vivek_official/firebase_sdk.dart/myApp5.dart';
import 'firebase_options.dart';
import 'package:flutter_sample/ravi/MyAppStart.dart';
import 'package:flutter_sample/vivek_official/shared_preference/my_app4.dart';
import 'package:flutter_sample/vivek_official/stream_sample/myapp3.dart';
import 'package:flutter_sample/vivek_official/news_project/main/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(MyApp5());
}
