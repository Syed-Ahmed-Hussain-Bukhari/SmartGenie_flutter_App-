
import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/AuthenticationView.dart/verficationCode.dart';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneAuthController extends GetxController {
  RxString verificationId = ''.obs;
  RxBool isLoading = false.obs;

  // Send OTP to phone number
  Future<void> sendOTP(String phoneNumber) async {
    isLoading(true);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar(
            '', // Leave title empty if not needed
            '',
            titleText:Text(
              "Error",
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
            ) ,
            messageText: Text(
              e.message ?? "Verification failed",
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
            
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
            colorText: MyColors.whiteColor,
            backgroundColor: MyColors.userTextColor,
            borderRadius: 20, // Roundness of the snackbar corners
            snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
          );
              
              },
              codeSent: (String verificationId, int? resendToken) {
                this.verificationId.value = verificationId;
                Get.to(VerficationCode());
              },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } finally {
      isLoading(false);
    }
  }

  // Verify the OTP
  Future<void> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Success",
        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
      ) ,
      messageText: Text(
        "Phone number verified successfully",
        style: TextStyle(color: Colors.white,fontSize: 18),
      ),
      
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10), // Margin for spacing around the snackbar
      colorText: MyColors.whiteColor,
      backgroundColor: MyColors.userTextColor,
      borderRadius: 20, // Roundness of the snackbar corners
      snackStyle: SnackStyle.FLOATING, // Makes the snackbar float above the content
    );
     
      await onLoginSuccess();
    } catch (e) {
      Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Error",
        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
      ) ,
      messageText: Text(
        "Invalid OTP",
        style: TextStyle(color: Colors.white,fontSize: 18),
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
