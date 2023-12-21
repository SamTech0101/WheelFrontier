import 'package:flutter/material.dart';
import '../constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function validator;
  const TextFieldWidget({Key key, @required this.text, @required this.icon, this.validator}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(fontSize: 15,color: blueColor),
          filled: true,
          prefixIcon: Icon(icon,color: blueColor,),
          //default shape
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: blueColor)
          )


      ),
    )
    ;
  }
}