
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:ai_chat_bot/View/splashscreen.dart';
import 'package:ai_chat_bot/controller/GoogleAuthenticationController.dart';
import 'package:ai_chat_bot/controller/facebookAuthController.dart';
import 'package:ai_chat_bot/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    Get.put(GoogleAuthController());
    Get.put(FacebookAuthenticationController());
  runApp(ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartGenie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
    );
  }
}

