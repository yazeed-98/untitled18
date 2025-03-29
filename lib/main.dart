
import 'package:flutter/material.dart';
import 'package:untitled18/screens/Alarm.dart';

import 'package:untitled18/screens/Screen1.dart';
import 'package:untitled18/screens/enterScreen.dart';
import 'package:untitled18/screens/loginScreen.dart';
import 'package:untitled18/screens/mad.dart';
import 'package:untitled18/screens/midical.dart';
import 'package:untitled18/screens/regester.dart';
import 'package:untitled18/screens/shopScreen.dart';

import 'clases/CARD.dart';

main (){
runApp(Main());


}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
      home:
      Enterscreen()


    ) ;
  }
}
