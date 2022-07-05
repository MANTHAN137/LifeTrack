import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifetrack/views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LifeTrack",
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: const LoginScreen(),
    );
  }
}
