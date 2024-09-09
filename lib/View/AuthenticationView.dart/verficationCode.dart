import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/Utils/constants.dart';
import 'package:ai_chat_bot/View/AuthenticationView.dart/phoneRegistration.dart';
import 'package:ai_chat_bot/controller/phoneController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerficationCode extends StatefulWidget {
  const VerficationCode({super.key});

  @override
  State<VerficationCode> createState() => _VerficationCodeState();
}

class _VerficationCodeState extends State<VerficationCode> {
  final PhoneAuthController phoneAuthController = Get.put(PhoneAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              myText(context, "Verification Code", MyColors.userTextColor,
                  MediaQuery.sizeOf(context).width * 0.095, 0.04, 0.09),
              myText(context, "Please type the verification code sent to",
                  MyColors.userTextColor,
                  MediaQuery.sizeOf(context).width * 0.045, 0.04, 0.01),
              myText(context, "your phone", MyColors.userTextColor,
                  MediaQuery.sizeOf(context).width * 0.045, 0.04, 0),
              constant.mySizedBox(context, 0, 0.08),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Pinput(
                  length: 6,
                
                  onChanged: (value) {
                    if (value.length == 6) {
                          // Only trigger function when all fields are filled
                          phoneAuthController.verifyOTP(value);
                        }
                   
                  },
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 70,
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: MyColors.mainColor,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: MyColors.userTextColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 70,
                    textStyle: TextStyle(
                        fontSize: 25,
                        color: MyColors.mainColor,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.5, color: MyColors.mainColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText(context, "I don't receive a code! ",
                      MyColors.userTextColor, 18, 0, 0.02),
                  InkWell(
                      onTap: () {
                        Get.to(PhoneRegistration());
                      },
                      child: myText(context, "Please resend",
                          MyColors.mainColor, 18, 0, 0.02)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
