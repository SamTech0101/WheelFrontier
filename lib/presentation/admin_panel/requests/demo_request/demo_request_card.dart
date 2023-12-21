import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/admin-panel/requests/demo_request/demo_request.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:intl/intl.dart';

import 'demo_request_page.dart';

class DemoRequestCard extends StatelessWidget {
  final DemoRequest demoRequest;

  DemoRequestCard({@required this.demoRequest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Get.to(DemoRequestPage(demoRequest: demoRequest));
        },
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
                    Text(demoRequest.firstName + demoRequest.lastName),
                    Text(DateFormat.yMd().format(demoRequest.date)),
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
                      demoRequest.comment,
                      maxLines: 1,
                    )),
                    TagChip(text: demoRequest.status, colorIndex: 6),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
