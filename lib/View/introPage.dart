import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/AuthenticationView.dart/LoginView.dart';
import 'package:ai_chat_bot/View/chatBotPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyChatBotIntroPage extends StatelessWidget {
  const MyChatBotIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
           
          children: [
                   Container(
                  margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.09,bottom: 0),
                  child: Text("SmartGenie",style: TextStyle(fontWeight: FontWeight.bold,color: MyColors.mainColor,fontSize: 30, decoration: TextDecoration.underline,),)   
                   ),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(top: 15,right: 15,left: 12,bottom: 15),
                  child: Text("Using SmartGenie, you can generate images, ask questions, analyze visuals, and receive smart suggestions—all powered by an advanced AI assistant. Share and download content, access answers in any language, and even have your responses spoken aloud.",textAlign: TextAlign.justify,style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500,letterSpacing: 0.5,color: MyColors.userTextColor,),)
                          ),
                 Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Image.asset("assets/images/Syed Ahmed (5).png")),
                 InkWell(
                  onTap: (){
                    Get.to(LoginView());
                  },
                   child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.01),
                    padding: EdgeInsets.only(left: 55,right: 55,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: MyColors.mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: myCustomWidget.myText("Continue", 20, MyColors.whiteColor),
                   ),
                 ),
                 SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}