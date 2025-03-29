import 'package:flutter/material.dart';

import 'loginScreen.dart';


class Enterscreen extends StatefulWidget {


  @override
  State<Enterscreen> createState() => _EnterscreenState();
}

class _EnterscreenState extends State<Enterscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xcdb3d2d5),
      body: Stack(


        children: [

          
          Center(
          child: Container(
          height: 465,
        
            child: Image(image: AssetImage('assets/images/enter1.png'),
          fit: BoxFit.cover, ),),


          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
margin: EdgeInsets.only(bottom: 40,left: 130),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xcd5f916e)
                    ),
                    onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Loginscreen() ,));

                    }, child: Text('lets go',
                  style: TextStyle(color:Color(0xcd135b5d)),),)),
            ],
          ),

        ]
      ),



    );
  }
}
