import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled18/screens/loginScreen.dart';

class SignupClass extends StatefulWidget {
  const SignupClass({super.key});

  @override
  State<SignupClass> createState() => _SignupClassState();
}

class _SignupClassState extends State<SignupClass> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController major = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/scren3.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Form(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: pass,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      controller: age,
                      decoration: InputDecoration(labelText: 'Age'),
                    ),
                    TextFormField(
                      controller: major,
                      decoration: InputDecoration(labelText: 'Major'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        String msg = await signUp(email.text, pass.text);
                        print(msg);
                        if (msg == 'null') {
                          await addUsere(); // إضافة بيانات المستخدم
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(msg)),
                          );
                        }
                      },
                      child: Text("Sign up"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await signInWithGoogle();
                          await addUsere(); // إضافة بيانات المستخدم
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        } catch (e) {
                          print("Google sign-in failed: $e");
                        }
                      },
                      child: Text("Sign up with Google"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text("Already have an account?"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> signUp(String email, String pass) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return 'null';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email is already in use.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address.';
      }
    }
    return 'Something went wrong.';
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  addUsere (){

    CollectionReference users=FirebaseFirestore.instance.collection("Users");
    users.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'Name':name.text,




    });
    }
  }

