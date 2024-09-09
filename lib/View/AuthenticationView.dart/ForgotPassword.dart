
import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/controller/forgetPasswordController.dart';
import 'package:ai_chat_bot/controller/passwordController.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat_bot/Utils/constants.dart';
import 'package:get/get.dart';

class resetPassword extends StatelessWidget {
  

  TextEditingController resPassword=TextEditingController();

  final _resetPasswordController = Get.put(resetPasswordController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                       
                       InkWell(
                        onTap: (){
                         Get.back();
                        },
                        child: myBackButton(context)),  
              ],),
                      myText(context, "Resset Password", MyColors.userTextColor,  MediaQuery.sizeOf(context).width*0.095, 0.05, 0.09),
                      constant.mySizedBox(context,0,0.03),
                      myText(context, "Please enter your email address to", MyColors.userTextColor,  MediaQuery.sizeOf(context).width*0.045, 0.05, 0.01),
                      myText(context, "request a password resset",MyColors.userTextColor,  MediaQuery.sizeOf(context).width*0.045, 0.05, 0),
                       constant.mySizedBox(context,0,0.03),
                       myTextField(context, 0.8, 55, 0.06, 0.01, MyColors.mainColor, MyColors.userTextColor,"Your email or phone",resPassword,false),
    
                      // myTextField(context, 0.9, 65, 0.05, 0.04, constant.myMainColor, constant.myGreyColor,"Your email or phone"),
                      constant.mySizedBox(context,0,0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                           InkWell(
                            onTap: (){
                              _resetPasswordController.myResPassword(resPassword.text.toString());
                            },child: mycustomeButton(context, 270, 60,25,"SEND NEW PASSWORD", MyColors.whiteColor, 16, MyColors.mainColor, 0, 0, 0, 0, 0,0),
                           )
                                  ],),
                                ]
          ),
        ]
      ),
    );
  }
}