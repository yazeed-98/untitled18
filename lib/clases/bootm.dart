import 'package:flutter/material.dart';
import 'package:untitled18/screens/Screen1.dart';

import '../screens/midical.dart';
import '../screens/pharmice.dart';
import 'CARD.dart';


class Bootm extends StatefulWidget {


  @override
  State<Bootm> createState() => _BootmState();
}

class _BootmState extends State<Bootm> {
  @override
  int index = 0;

  final List<Widget> screens = [
Screen1(),
    PharmacyListScreen(),
    MedicineScreen ()

  ];

  Widget build(BuildContext context) {
    return Scaffold(




    body: IndexedStack(
    index: index, // عرض الشاشة بناءً على الفهرس
    children: screens,
    ),
    bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.lightGreenAccent,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.brown.shade800,
    currentIndex: index,
    items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined), label: 'Pharmacy'),
    BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined), label: 'Cart'),

    ],
    onTap: (v) {
    setState(() {
    index = v;




    });
    },
    ),
    );
    }
}




