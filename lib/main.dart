import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskyapp/features/auth/screens/login_screen.dart';
import 'package:taskyapp/features/auth/screens/onboarding.dart';
import 'package:taskyapp/features/auth/screens/register_sceen.dart';
import 'package:taskyapp/features/home/screens/home_screen.dart';
import 'package:taskyapp/features/auth/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
      },
    );
  }
}
