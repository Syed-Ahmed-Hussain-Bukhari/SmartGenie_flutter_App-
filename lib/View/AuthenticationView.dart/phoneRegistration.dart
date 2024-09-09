import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/Utils/constants.dart';
import 'package:ai_chat_bot/controller/phoneController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneRegistration extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final PhoneAuthController phoneAuthController = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: myBackButton(context),
                  ),
                ],
              ),
              myText(context, "Registration", MyColors.userTextColor,
                  MediaQuery.sizeOf(context).width * 0.095, 0.05, 0.09),
              constant.mySizedBox(context, 0, 0.03),
              myText(context, "Enter your phone number to verify",
                  MyColors.userTextColor,
                  MediaQuery.sizeOf(context).width * 0.045, 0.05, 0.01),
              myText(context, "your account", MyColors.userTextColor,
                  MediaQuery.sizeOf(context).width * 0.045, 0.05, 0),
              constant.mySizedBox(context, 0, 0.03),
              myTextField(
                  context,
                  0.8,
                  55,
                  0.06,
                  0.01,
                  MyColors.mainColor,
                  MyColors.userTextColor,
                  "Your phone",
                  phoneNumberController,
                  false),
              constant.mySizedBox(context, 0, 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      phoneAuthController
                          .sendOTP(phoneNumberController.text.trim());
                    },
                    child: mycustomeButton(
                        context,
                        270,
                        60,
                        25,
                        "SEND",
                        MyColors.whiteColor,
                        16,
                        MyColors.mainColor,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
