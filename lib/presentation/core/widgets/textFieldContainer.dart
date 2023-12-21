import 'package:flutter/material.dart';

import '../constants.dart';
class FieldContainer extends StatelessWidget {
  final Widget child;
  final Color colors;
  const FieldContainer({Key key, this.child, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
          color:colors,
          borderRadius: BorderRadius.circular(29)
      ),
      child: child,

    );
  }
}
