
import 'package:ai_chat_bot/Utils/Utils.dart';
import 'package:flutter/material.dart';

class constant{


     static mySizedBox(context,double myWidth,double myHeight){
      return SizedBox(
        width: MediaQuery.sizeOf(context).width*myWidth,
        height: MediaQuery.sizeOf(context).height*myHeight,
      );

     }
}

//Text method
myText(context,String txt,Color clr,double size,double leftSide,double topSide){
        return Container(
          margin: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*leftSide,top: MediaQuery.sizeOf(context).height*topSide),
          child: Text(txt,style: TextStyle(color: clr,fontSize: size,fontWeight: FontWeight.bold),)
          );

      }


// custom Button
mycustomeButton(context,double myWidth,double myHeight,double radius,
      String txt,Color myTextColor,double size,Color myButtonColor,double leftSide,double topSide,double rightSide,double imageWidth,double imageleftSideImage,double imageRightSideSpace,{Image ?image}
      ){
        return Container(
          margin: EdgeInsets.only(left:MediaQuery.sizeOf(context).width*leftSide,top:MediaQuery.sizeOf(context).height*topSide ,right: MediaQuery.sizeOf(context).width*rightSide),
          width: myWidth,
          height: myHeight,
          decoration: BoxDecoration(
            color: myButtonColor,
            boxShadow:const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(3, 5),
              )
            ],
            borderRadius: BorderRadius.circular(radius),
          ),

          child:Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: imageleftSideImage,right: imageRightSideSpace),
                width:imageWidth,
                child: image,
              ),
              
              Text(txt,style: TextStyle(color: myTextColor,fontSize: size,fontWeight: FontWeight.bold),),
            ],
          )),

        );
      }




myBackButton(context){
   return Container(
     margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.06,top: MediaQuery.sizeOf(context).height*0.025),
     width: 38,
     height: 38,
     decoration: BoxDecoration(
       color: MyColors.whiteColor,
       borderRadius: BorderRadius.circular(15),
        boxShadow:const [
         BoxShadow(
       color: Colors.black12,
       offset: Offset(3, 5),
     )
   ],
     ),
     child: Icon(Icons.arrow_back,color: MyColors.userTextColor,),
   );
              
}


// 


myTextField(context ,double width,double height,double marginwidth,double marginHeight,Color focusedColor,Color enabledColor,String hintText,TextEditingController textController,bool totHide ,{Icon? prefixIcon,Icon? suffixIcon}){
   return Container(
    
                        width: MediaQuery.sizeOf(context).width*width,
                        height: height,
                        margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*marginwidth,top: MediaQuery.sizeOf(context).height*marginHeight ),
                         child: TextField(
                          cursorColor: MyColors.mainColor,
                                    obscureText: totHide,
                                   enableSuggestions: true,
                                   
                                   controller: textController,
                                  
                                   decoration: InputDecoration(
                                    
                                    hintText: hintText,
                                     prefixIcon: prefixIcon,
                                     suffixIcon: suffixIcon,
                                     
                                     enabledBorder: OutlineInputBorder(
                                      
                                       borderRadius: BorderRadius.circular(12),
                                       borderSide: BorderSide(
                                         color: enabledColor,
                                         width: 2.0,
                                       )
                                     ),
                                     
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(12),
                                       borderSide: BorderSide(
                                         color: focusedColor,
                                         width: 2.0,
                                       )
                                     )
                                   ),
                                 ),
                       );
}


