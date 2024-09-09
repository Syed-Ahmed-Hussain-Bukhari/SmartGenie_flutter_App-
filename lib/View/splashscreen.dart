import 'dart:async';

import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/introPage.dart';
import 'package:ai_chat_bot/controller/CheckCurrentUserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  final myCurrentUserController=Get.put(checkUserController());
  @override
  void initState() {
    myCurrentUserController.checkUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
               Center(
                child: Image.asset("assets/images/wappGPTlogo (2).png",),
               ),
               SizedBox(height: 5,),
               myCustomWidget.myText("SmartGenie", 35, Color.fromARGB(255, 231, 219, 219))
      ]
      ),
    );
  }
}