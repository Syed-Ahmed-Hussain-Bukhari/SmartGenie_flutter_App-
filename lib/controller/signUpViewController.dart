
import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUpController extends GetxController{

  
signUpUser(context,String email,String password) async{
  try{
      final Credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await onLoginSuccess();
     
  }
  on FirebaseAuthException catch(e){
        if (e.code == 'weak-password') {
                Get.snackbar(
            '', // Leave title empty if not needed
            'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
            colorText: MyColors.whiteColor,
            backgroundColor: MyColors.mainColor,
            borderRadius: 20, // Roundness of the snackbar corners
            snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
          );
        
      } else if (e.code == 'email-already-in-use') {
         Get.snackbar(
      '', // Leave title empty if not needed
      'The account already exists for that email.',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.mainColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    );
        
      }

  }
  catch(e){
        Get.snackbar(
      '', // Leave title empty if not needed
      '$e',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.mainColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    );
  }
}
}

Future<void> onLoginSuccess() async {
    // Set the isLoggedIn value to true in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    // Navigate to the main screen
    Get.offAll(ChatScreen());
  }
