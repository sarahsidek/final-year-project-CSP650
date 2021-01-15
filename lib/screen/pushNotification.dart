import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService{
   final FirebaseMessaging _fcm = FirebaseMessaging();

   Future initialise() async {
     _fcm.configure(
       //called when the app is in the foreground and we receive and we receive a push notification
       onMessage: (Map <String, dynamic> message) async {
         print("onMessage: $message");
       },
       // called when the apps has been closed  completely and it's opened
       //form the push notification directly
       onLaunch: (Map <String, dynamic> message) async {
         print("onLaunch: $message");
       },

       //called when the apps is in the background and it's opened.
       onResume: (Map <String, dynamic> message) async {
         print("onResume: $message");
       },
     );
     _fcm.getToken().then((String token){
         if(token != null){
           Firestore.instance.collection("Supervisor").document('uid').collection("Token").document(token).setData({
             'id': token,
           });
         }
         print(token);
     });
   }


}