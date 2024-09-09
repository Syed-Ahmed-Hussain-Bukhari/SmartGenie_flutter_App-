import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewController extends GetxController {

  Future<void> loginUser(BuildContext context, String email, String password) async {
    try {
      // Attempt to sign in the user with Firebase
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If login is successful, set isLoggedIn to true in SharedPreferences
      await onLoginSuccess();

    } on FirebaseAuthException catch (e) {
      // Handle different FirebaseAuthExceptions
      if (e.code == 'user-not-found') {
        Get.snackbar(
          '', 
          'No user found for that email.',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),
          colorText: MyColors.whiteColor,
          backgroundColor: MyColors.mainColor,
          borderRadius: 20,
          snackStyle: SnackStyle.FLOATING,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          '', 
          'Wrong password provided for that user.',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),
          colorText: MyColors.whiteColor,
          backgroundColor: MyColors.mainColor,
          borderRadius: 20,
          snackStyle: SnackStyle.FLOATING,
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
}
