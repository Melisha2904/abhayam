import 'package:abhayam/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/firebase_options.dart';
import 'forgot_password.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'basic_laws.dart';
import 'location_sharing.dart';
import 'nearby_guardian.dart';
import 'elearn.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abhayam',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => const AuthPage(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/home': (context) => HomeScreen(),
        '/basic-laws': (context) => BasicLawsScreen(),
        '/location-sharing': (context) => LocationSharingScreen(),
        '/nearby-guardian': (context) => NearbyGuardianScreen(),
        '/e-learning': (context) => ELearningScreen(),
      },
    );
  }
}
