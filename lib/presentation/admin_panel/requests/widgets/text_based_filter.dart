import 'package:flutter/material.dart';

class TextBasedFilter extends StatelessWidget {
  final String filterName;
  final TextEditingController controller;

  TextBasedFilter({@required this.filterName, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Container(
          width: 180,
          child: Text(
            filterName + ' :',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
