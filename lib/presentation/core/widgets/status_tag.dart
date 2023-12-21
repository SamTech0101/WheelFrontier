import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusTag extends StatelessWidget {
  final String status;
  StatusTag({@required this.status});

  String statusIcon(String status) {
    switch (status) {
      case 'Not Seen':
        return 'assets/images/not-seen.svg';
        break;
      case 'Seen':
        return 'assets/images/seen.svg';
        break;
      case 'Followed':
        return '';
        break;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(statusIcon(status),
        height: 18,
        width: 18,
        color:
            status == 'Seen' ? Color.fromRGBO(20, 125, 245, 1) : Colors.black);
  }
}
