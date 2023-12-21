import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/presentation/admin_panel/ticket_page/ticket_detail_page.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:intl/intl.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  TicketCard({@required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => TicketDetailPage(ticket: ticket));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        ticket.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Text(
                      '${DateFormat.yMd().format(ticket.createdAt)} at ${ticket.createdAt.hour}:${ticket.createdAt.minute} ',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  ticket.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 5),
                    child: Text(ticket.name),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        right: 25,
                      ),
                      child: TagChip(text: ticket.status, colorIndex: 9)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
