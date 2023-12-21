import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:abs_customer_sites/presentation/core/widgets/textFieldWidget.dart';

class ConfirmCookie extends StatefulWidget {
  const ConfirmCookie({Key key}) : super(key: key);

  @override
  _ConfirmCookieState createState() => _ConfirmCookieState();
}

class _ConfirmCookieState extends State<ConfirmCookie> {
  var _key =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            alignment: Alignment.center,
            width: double.maxFinite,
            height: 150,
            child: Text(
              "Confirm",
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(20))),
          ),
          Container(
            margin: EdgeInsets.only(top: 230),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFieldWidget(
                    text: "Code", icon: Icons.admin_panel_settings_sharp,
                    validator: (String txt){
                      if(txt.length<8)
                        return "confirm code is 8 character";},),
                  SizedBox(height: 15,),
                  Text("Please enter confirm code.It sent to your email",textAlign: TextAlign.start,),
                  SizedBox(height: 30,),
                  MaterialButton(onPressed: (){
                    _key.currentState.validate();
                  },color: blueColor,
                    child: Text("Send",style: TextStyle(color: whiteColor,fontSize: 15),),

                  ),

                ],
              ),
            ),
          ),
        ],
        ),

/*
        body: Column(
          children: [
            Stack(
              children: [

              ],),
            Container(
              height: 160,
                color: Colors.amber,
                )

          ],
        ),
*/
      ),
    );
  }
}

/*
Future<bool> addConfirmCookieDialog() async{
  bool addConfirmCookie =false;
    await Get.dialog(Dialog(
     backgroundColor: Colors.transparent,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          elevation: 0,
          color: Colors.transparent
          ,child: Column(children: [
            Text("Confirm",style: TextStyle(fontSize: 20),),
          SizedBox(height: 30,),
          Text("Please enter confirm code that it sent to your email"),
          Spacer(),
          TextField(),
          Text("Timer"),
          MaterialButton(onPressed: (){},
          child: Text("Send",style: TextStyle(fontSize: 15),),)


        ],),
        ),
      ),
    ),
      barrierDismissible: false
    );
  return addConfirmCookie;

}
*/