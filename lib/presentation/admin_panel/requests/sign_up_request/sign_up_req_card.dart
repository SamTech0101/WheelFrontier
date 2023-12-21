import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/sign_up_request/sign_up_req_page.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:intl/intl.dart';

class SignUpRequestCard extends StatelessWidget {
  final SignUpRequest signUpRequest;

  SignUpRequestCard({@required this.signUpRequest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Get.to(SignUpRequestDetailPage(signUpRequest: signUpRequest));
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
                    Text(signUpRequest.bussinessName),
                    Text(DateFormat.yMd().format(signUpRequest.createdAt)),
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
                        signUpRequest.businessWebsite,
                        maxLines: 1,
                      ),
                    ),
                    TagChip(
                        text: signUpRequest.status.toString(), colorIndex: 6),
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
