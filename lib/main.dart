import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// شاشات التطبيق
import 'package:untitled18/screens/Alarm.dart';
import 'package:untitled18/screens/SCREEEN%20NAME.dart';
import 'package:untitled18/screens/Screen1.dart';
import 'package:untitled18/screens/enterScreen.dart';
import 'package:untitled18/screens/location.dart';
import 'package:untitled18/screens/loginScreen.dart';
import 'package:untitled18/screens/mad.dart';
import 'package:untitled18/screens/midical.dart';
import 'package:untitled18/screens/pharmice.dart';
import 'package:untitled18/screens/regester.dart';
import 'package:untitled18/screens/shopScreen.dart';
import 'package:untitled18/screens/sign in.dart';

import 'clases/CARD.dart';

// التهيئة التلقائية من Firebase CLI
import 'firebase_options.dart';
import 'masseging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // التهيئة الصحيحة لفirebase
  );
  runApp(const MainClass());
}

class MainClass extends StatefulWidget {
  const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  Widget build(BuildContext context) {
    Maseging().cls();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen  (), // يمكنك تغيير الشاشة الرئيسية لاحقًا
    );
  }
}
