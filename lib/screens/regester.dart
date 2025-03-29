import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../clases/formFaild.dart';

class Regester extends StatefulWidget {


  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  final _formKey =GlobalKey<FormState>();
  bool? see;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body:
 Stack(
          children: [ Container(
            width: double.infinity,
            height: double.infinity,
            child: Image(image: AssetImage('assets/images/scren3.jpeg',),
              fit: BoxFit.cover,
            ),
          ),
            Form(
                key: _formKey,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Formfaild (label: 'email',hint: 'example yazeed@gmail.com',
                        preIcon: Icons.email,
                        border: Color(0xcd758987),
                        borderRades: 10,
                        value: (email){
                          if (!(emailValidation(email))){
                            return 'not valued';
                          }
                          return null;

                        },
                      ),

                    ),
                    SizedBox(height: 30,),
                    Formfaild(
                      label: 'password',
                      hint: '123@#/WERF',
                      preIcon: Icons.password,
                      border:Color(0xcd758987),
                      sufixIcon: Icons.remove_red_eye_outlined,
                      borderRades: 10,
                      value: (p0) {
                        if (!(passValidation(p0))){
                          return 'not valued';

                        }
                        return null;
                      },
                    ),



                  ],

                )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50,left: 140),
                  child: ElevatedButton(onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      print('done');
                    }

                  }, child: Text('Register',
                    style: TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.w900,
                        fontSize: 20
                    ),),
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Color(0xcd758987)
                      )

                  ),
                ),
              ],
            )
          ]
      ),


    );
  }
}
bool emailValidation(email){
  String pat = r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
  return RegExp(pat).hasMatch(email);
}


bool passValidation(pass){
  String pat = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
  return RegExp(pat).hasMatch(pass);
}