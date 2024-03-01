import 'package:flutter/material.dart';
import 'package:rentapp2/app/di/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rentapp2/app/features/auth/presentation/app.dart';
import 'package:rentapp2/firebase_options.dart';
import 'package:rentapp2/utils/utils.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // await FirebaseAppCheck.instance.activate();//какое то прохождение проверки

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await signInUserAnonFirebase();//авторизация пользователя под анонимом

  await init();

  runApp( const App());
}


