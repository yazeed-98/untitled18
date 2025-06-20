
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled18/screens/SCREEEN%20NAME.dart';
import 'package:untitled18/screens/regester.dart';

import 'Screen1.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController major = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
        Container(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage('assets/images/scren3.jpeg'),
          fit: BoxFit.cover,
        ),
      ),





      SafeArea(child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: email,
              ),
              TextFormField(
                controller: password,
              ),
              TextFormField(
                controller: name,
              ),
              ElevatedButton( onPressed: () async {
                String msg = await Login(email.text.trim(), password.text.trim());
                if (msg == 'null') {
                  // تسجيل الدخول نجح
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenName()),
                  );
                } else {
                  // فشل تسجيل الدخول
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(msg)),
                  );
                }
              },
                child: Text("Sign in"),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupClass(),));
              }, child: Text("dont have an account?"))
            ],
          )
      )),
   ] ));
  }


  Future<String> Login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'null';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return 'Error: ${e.message}';
      }
    }
  }
}














