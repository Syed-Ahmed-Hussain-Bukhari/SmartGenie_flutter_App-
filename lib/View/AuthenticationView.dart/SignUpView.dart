import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:ai_chat_bot/View/AuthenticationView.dart/LoginView.dart';
import 'package:ai_chat_bot/View/AuthenticationView.dart/phoneRegistration.dart';
import 'package:ai_chat_bot/controller/GoogleAuthenticationController.dart';
import 'package:ai_chat_bot/controller/facebookAuthController.dart';
import 'package:ai_chat_bot/controller/passwordController.dart';
import 'package:ai_chat_bot/controller/signUpViewController.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat_bot/Utils/constants.dart';
import 'package:get/get.dart';



class SignUpView extends StatelessWidget {

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  final _signUpController = Get.put(signUpController());
  final PasswordController myPasswordController = Get.put(PasswordController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
            
                       
                       InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: myBackButton(context)),
                       
              ],),

              // Sign Up text
              constant.mySizedBox(context, 0, 0.04),
              myText(context, "Sign Up", MyColors.userTextColor, 28, 0.08, 0),
              myText(context, "Full name", MyColors.userTextColor, 18, 0.09, 0.035),
              myTextField(context, 0.8, 55, 0.09, 0.01, MyColors.mainColor,MyColors.userTextColor,"Your Full Name..",nameController,false),
               myText(context, "E-mail", MyColors.userTextColor, 18, 0.09, 0.035),
              myTextField(context, 0.8, 55, 0.09, 0.01,  MyColors.mainColor,MyColors.userTextColor,"Your Email or phone",emailController,false),
              myText(context, "Password",  MyColors.userTextColor, 18, 0.09, 0.035),
              // myTextField(context, 0.8, 55, 0.09, 0.01,  MyColors.mainColor,MyColors.userTextColor,"Password",passwordController,true,suffixIcon: Icon(Icons.remove_red_eye,color: MyColors.userTextColor,)),
              Obx(() =>  Container(
    
                        width: MediaQuery.sizeOf(context).width*0.8,
                        height: 55,
                        margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.09,top: MediaQuery.sizeOf(context).height*0.01 ),
                         child: TextField(
                          cursorColor: MyColors.mainColor,
                                    obscureText: myPasswordController.isPasswordHidden.value,
                                   enableSuggestions: true,
                                   controller: passwordController,
                                  
                                   decoration: InputDecoration(
                                    
                                    hintText: "Password",
                                     
                                     suffixIcon: IconButton(
                                      icon: Icon(
                                        myPasswordController.isPasswordHidden.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                            color: MyColors.userTextColor,
                                      ),
                                      onPressed: myPasswordController.togglePasswordVisibility,
                                    ),
                                     
                                     enabledBorder: OutlineInputBorder(
                                      
                                       borderRadius: BorderRadius.circular(12),
                                       borderSide: BorderSide(
                                         color: MyColors.userTextColor,
                                         width: 2.0,
                                       )
                                     ),
                                     
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(12),
                                       borderSide: BorderSide(
                                         color: MyColors.mainColor,
                                         width: 2.0,
                                       )
                                     )
                                   ),
                                 ),
                       ),),
              Center(
                child:  InkWell(
                    onTap: () {
                     _signUpController.signUpUser(context, emailController.text.toString(), passwordController.text.toString());
                    },
                    child: mycustomeButton(
                        context,
                        250,
                        64,
                        25,
                        "SIGN UP",
                        MyColors.whiteColor,
                        19,
                         MyColors.mainColor,
                        0.06,
                        0.03,
                        0.06,
                        0,
                        0,
                        0),
                  ),
              ),

              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myText(context, "Already have an account?",
                          MyColors.userTextColor, 16, 0.04, 0.035),
                      InkWell(
                        onTap: () {
                         Get.to(LoginView());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                           margin: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*0.02,top: MediaQuery.sizeOf(context).height*0.035),
                          child: Text("Login",style: TextStyle( decoration: TextDecoration.underline,color: MyColors.mainColor,fontSize: 18,fontWeight: FontWeight.bold),)),
                        
                      ),
                    ],
                  ),
                 
                 constant.mySizedBox(context,0,0.03),
                 //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color:MyColors.userTextColor,
                        width: 80,
                        height: 1.5,
                      ),
                      myText(context, "Sign up with", MyColors.userTextColor,17, 0.01, 0),
                      Container(
                        margin: const EdgeInsets.only(left: 6,top: 0),
                        color: MyColors.userTextColor,
                        width: 80,
                        height: 1.5,
                      ),
                    ],
                  ),

                  //
                  constant.mySizedBox(context, 0, 0.03),
                 Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(PhoneRegistration());
                        },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: MyColors.whiteColor,
                          child: Image.network("https://th.bing.com/th/id/OIP.MGndC4De5v5LZb2CXYIGxAHaHa?w=600&h=600&rs=1&pid=ImgDetMain"),
                        ),
                      ),
                      constant.mySizedBox(context, 0.05, 0),
                      InkWell(
                        onTap:(){
                          FacebookAuthenticationController.instance.signInWithFacebook();
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: MyColors.whiteColor,
                          child: Image.asset("assets/images/facebook_Icon.png",width: 120,),
                        ),
                      ),
                      constant.mySizedBox(context, 0.05, 0),
                      InkWell(
                        onTap: (){
                          GoogleAuthController.instance.signInWithGoogle();
                        },
                        child: CircleAvatar(
                          radius: 27,
                           backgroundColor: MyColors.userTextbgColor,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Image.asset("assets/images/google_Icon.png",width: 80,)),
                        ),
                      ),
                     
                    ],
                  ),
                  constant.mySizedBox(context, 0, 0.04),
            ],
          ),
        ],
      )
    );
  }
}