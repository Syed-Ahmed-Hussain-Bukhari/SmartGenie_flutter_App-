
import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/AuthenticationView.dart/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    try {
      // Check the current provider and sign out accordingly
      User? user = _auth.currentUser;
      if (user != null) {
        if (user.providerData.any((info) => info.providerId == 'google.com')) {
          await _auth.signOut();
          await GoogleSignIn().signOut();
        } else if (user.providerData.any((info) => info.providerId == 'facebook.com')) {
          await _auth.signOut();
          await FacebookAuth.instance.logOut();
        } else if (user.providerData.any((info) => info.providerId == 'phone')) {
          await _auth.signOut();
        } else if (user.providerData.any((info) => info.providerId == 'password')) {
          await _auth.signOut();
        }
      }
       SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setBool('isLoggedIn', false);

      // Show success message and navigate to login view
       Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Logout",
        style: TextStyle(color: Colors.white,fontSize: 17.5,fontWeight: FontWeight.w600),
      ) ,
      messageText: Text(
        "Successfully logged out",
        style: TextStyle(color: Colors.white,fontSize: 16),
      ),
      
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.userTextColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    );
      Get.to(LoginView());// Navigate to LoginView
    } catch (e) {
      // Handle error
      Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Error",
        style: TextStyle(color: Colors.white,fontSize: 17.5,fontWeight: FontWeight.w600),
      ) ,
      messageText: Text(
        "Failed to log out",
        style: TextStyle(color: Colors.white,fontSize: 16),
      ),
      
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.userTextColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    );
      
    }
  }
}
