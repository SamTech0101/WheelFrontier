import 'package:flutter/material.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:abs_customer_sites/presentation/core/widgets/textFieldContainer.dart';
import 'package:abs_customer_sites/presentation/core/widgets/textFieldWidget.dart';

class TestConfirm extends StatefulWidget {
  const TestConfirm({Key key}) : super(key: key);

  @override
  _TestConfirmState createState() => _TestConfirmState();
}

class _TestConfirmState extends State<TestConfirm> {
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _key,
        child: Container(
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/verified.png",
                height: size.height * 0.25,
              ),
              Text(
                "Verification",
                style: TextStyle(fontWeight: FontWeight.bold, color: blueColor),
              ),
              FieldContainer(
                  child: TextFieldWidget(
                      text: "Code", icon: Icons.admin_panel_settings_sharp,
                  validator: (String value){
                        if(value.length<8)
                          return "confirm code is 8 character";
                  },)),
              Text("Please enter confirm code.It sent to your email",textAlign: TextAlign.start,style: TextStyle(color: blueColor),),
              SizedBox(height: 10,),
              MaterialButton(onPressed: (){
                _key.currentState.validate();
              },color: blueColor,
                child: Text("Send",style: TextStyle(color: whiteColor,fontSize: 15),),

              ),


            ],
          ),
        ),
      ),
    );
  }
}
