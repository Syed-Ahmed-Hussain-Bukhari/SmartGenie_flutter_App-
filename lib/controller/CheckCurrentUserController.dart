
import 'dart:async';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:ai_chat_bot/View/introPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class checkUserController extends GetxController{

  
   checkUser()async{
  //  final user=FirebaseAuth.instance.currentUser;
   SharedPreferences prefs = await SharedPreferences.getInstance();
   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if(isLoggedIn){
      
      Timer(const Duration(seconds:4), () { 
      Get.to(ChatScreen());
    });

    } else{
      Timer(const Duration(seconds:4), () { 
       Get.to(MyChatBotIntroPage());

    });

    }
    }
}