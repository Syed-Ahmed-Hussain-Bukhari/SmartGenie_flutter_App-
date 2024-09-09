import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class resetPasswordController extends GetxController{


   final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> myResPassword(String _emailController) async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController);
       Get.snackbar(
      '', // Leave title empty if not needed
      '',
      messageText: Text(
        "Password reset email sent!",
        style: TextStyle(color: Colors.white,fontSize: 16),
      ),
      
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.userTextColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    );
      
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = 'Something went wrong. Please try again later.';
      }
      Get.snackbar(
            '', // Leave title empty if not needed
            '$message',
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