import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FacebookAuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  static FacebookAuthenticationController instance = Get.find();

  Future<void> signInWithFacebook() async {

    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
       
        await _auth.signInWithCredential(credential).then((value) => 
        Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Success",
        style: TextStyle(color: Colors.white,fontSize: 17.5,fontWeight: FontWeight.w600),
      ) ,
      messageText: Text(
        "Signed in as ${_auth.currentUser?.displayName}",
        style: TextStyle(color: Colors.white,fontSize: 16),
      ),
      
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.userTextColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    )
        );
        await onLoginSuccess();
      } else {
        // Handle error or cancellation
        print(result.message);
      }
    } catch (e) {
      // Get.snackbar("Error", "Failed to sign in with Facebook: $e");
      Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Error",
        style: TextStyle(color: Colors.white,fontSize: 17.5,fontWeight: FontWeight.w600),
      ) ,
      messageText: Text(
        "Failed to sign in with Facebook: $e",
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

Future<void> onLoginSuccess() async {
    // Set the isLoggedIn value to true in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    // Navigate to the main screen
    Get.offAll(ChatScreen());
  }

