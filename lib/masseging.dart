import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';



class Maseging {
  FirebaseMessaging _firebaseMessaging =FirebaseMessaging.instance;



  Future <void> handlarFan (RemoteMessage masg) async {

print(masg.data);

  }



  Future<void> cls ()async {
_firebaseMessaging.requestPermission();


String ? token =     await _firebaseMessaging.getToken();
print("token :$token");

FirebaseMessaging.onBackgroundMessage(handlarFan);

}




}

