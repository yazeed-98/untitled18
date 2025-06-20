import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled18/screens/Screen1.dart';

import '../clases/bootm.dart';
import '../clases/formFaild.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  // Controllers لحفظ المدخلات
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              image: AssetImage('assets/images/scren3.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Formfaild(
                    label: 'email',
                    hint: 'example@yazeed@gmail.com',
                    preIcon: Icons.email,
                    border: Color(0xcd758987),
                    borderRades: 10,

                    controller: email,

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Formfaild(
                  label: 'password',
                  hint: '123@#/WERF',
                  preIcon: Icons.password,
                  border: Color(0xcd758987),
                  sufixIcon: Icons.remove_red_eye_outlined,
                  borderRades: 10,

                  controller: password,

                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 140),
                child: ElevatedButton(
                  onPressed: ()async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(email: email.text, password: password.text);
                      print("تم إنشاء المستخدم بنجاح: ");
                    } catch (e) {
                      print("حدث خطأ: $e");
                    }

                  },

                    child:
                    Text(
                      'login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xcd758987
                    )


    )
  ),

  ) ],
          )
        ],
      ),
    );


  // Future<void> signUp(String email, String password) async {
  //   String message;
  //   try {
  //     FirebaseAuth auth = FirebaseAuth.instance;
  //
  //     // محاولة إنشاء الحساب
  //     await auth.createUserWithEmailAndPassword(email: email, password: password);
  //
  //     // إذا نجحت العملية، انتقل إلى الشاشة التالية
  //  message  = 'no error';
  //
  //   } on FirebaseAuthException catch (e) {
  //
  //     if (e.code == 'email-already-in-use') {
  //       message = 'هذا البريد مستخدم مسبقًا.';
  //     } else if (e.code == 'weak-password') {
  //       message = 'كلمة المرور ضعيفة جدًا.';
  //     } else if (e.code == 'invalid-email') {
  //       message = 'البريد الإلكتروني غير صالح.';
  //     } else {
  //       message = 'حدث خطأ غير متوقع: ${e.message}';
  //     }
  //
  //     // عرض رسالة الخطأ للمستخدم
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(message)),
  //     );
  //   }

    Future<String> signUp(String email,String pass) async{
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        );
        return 'null';
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return 'The password provided is too weak.';
        }
        else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
        }
        else if(e.code == 'invalid-email'){
          return 'invalid-email';
        }

      }
      return 'something wrong';
    }

  }
}





