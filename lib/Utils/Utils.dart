import 'package:flutter/material.dart';

class MyColors{

  static Color mainColor=Color(0xff5A189A);
  static Color whiteColor=Color(0xffFFFFFF);
  static Color userTextColor=Color(0xff444444);
  static Color appBarCircleColor=Color(0xff43EE7D);
  static Color userTextbgColor=Color(0xffDEE2E6);
  static Color bgColor=Color(0xffF8F9FA);


}

class myCustomWidget{
  
   static myText(String txt ,double fontSize, Color clr){
      return  Text(txt,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold,color: clr),);
    }



    

    static mycustomAppBar(){
      return  AppBar(

        // actions: selectedMessageIndex != null
        //     ? [
        //         IconButton(
        //           icon: Icon(Icons.copy),
        //           onPressed: _copyMessage,
        //         ),
        //         IconButton(
        //           icon: Icon(Icons.delete),
        //           onPressed: _deleteMessage,
        //         ),
        //       ]
        //     : [],


        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)
      )),
       leading: Container(
        margin: EdgeInsets.all(5),
        child: Image.asset("assets/images/wappGPTlogo.png"),
       ),
        elevation: 3,
        backgroundColor: MyColors.mainColor,
        title: Column(
          children: [
           Row(
            children: [ myCustomWidget.myText("Chatbot", 23, MyColors.whiteColor),],
           ),
            Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: MyColors.appBarCircleColor,
                ),
                SizedBox(width: 5,),
                 myCustomWidget.myText("Online", 14, MyColors.appBarCircleColor),
              ],
            )

          ],
        )
      );
    }

}




