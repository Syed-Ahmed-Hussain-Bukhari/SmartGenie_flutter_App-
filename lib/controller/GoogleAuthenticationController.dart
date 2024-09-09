// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthController extends GetxController {
//   // static AuthController instance = Get.find();
//   // Rx<User?> _user = Rx<User?>(null);
//   // User? get user => _user.value;

//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   // @override
//   // void onReady() {
//   //   super.onReady();
//   //   _user.bindStream(auth.authStateChanges());
//   //   ever(_user, _initialScreen);
//   // }

//   // _initialScreen(User? user) {
//   //   if (user == null) {
//   //     Get.offAll(() => LoginScreen());
//   //   } else {
//   //     Get.offAll(() => HomeScreen());
//   //   }
//   // }

//   void signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await auth.signInWithCredential(credential);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to sign in with Google: $e");
//     }
//   }

//   void signOut() async {
//     await auth.signOut();
//     await googleSignIn.signOut();
//   }
// }


import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthController extends GetxController {
  static GoogleAuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

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
        
        
      }
    } catch (e) {
      // Get.snackbar("Error", "Failed to sign in with Google: $e");
       Get.snackbar(
      '', // Leave title empty if not needed
      '',
      titleText:Text(
        "Error",
        style: TextStyle(color: Colors.white,fontSize: 17.5,fontWeight: FontWeight.w600),
      ) ,
      messageText: Text(
        "Failed to sign in with Google: $e",
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
