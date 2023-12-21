import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/admin-panel/requests/contact_us/contact_us.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:intl/intl.dart';

class ContactUsRequestCard extends StatelessWidget {
  final ContactUsAdmin contactUs;

  ContactUsRequestCard({@required this.contactUs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(contactUs.name),
                  Text(DateFormat.yMd().format(contactUs.date)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      contactUs.message,
                      maxLines: 1,
                    ),
                  ),
                  TagChip(text: contactUs.status, colorIndex: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
