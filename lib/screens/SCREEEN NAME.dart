import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled18/screens/Screen1.dart';

class ScreenName extends StatefulWidget {
  const ScreenName({super.key});

  @override
  State<ScreenName> createState() => _ScreenNameState();
}

class _ScreenNameState extends State<ScreenName> {
  String userName = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<String> getUserName() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
    await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    if (userDoc.exists) {
      return userDoc.get('Name');
    } else {
      return "Guest";
    }
  }

  void fetchUserName() async {
    String name = await getUserName();
    setState(() {
      userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصورة الخلفية تغطي كل الشاشة
          Positioned.fill(
            child: Image.asset(
              'assets/images/scren3.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // محتوى النص والزر في الأسفل
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome: $userName',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Screen1()));
                    },
                    child: Text('Start'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
