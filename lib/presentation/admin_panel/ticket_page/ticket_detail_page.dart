import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_detail_page/ticket_detail_page_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/presentation/admin_panel/ticket_page/ticket_reply_page.dart';
import 'package:abs_customer_sites/presentation/admin_panel/ticket_page/widgets/ticket_replies.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:intl/intl.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;
  TicketDetailPage({@required this.ticket});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TicketDetailPageBloc>(param1: ticket)..add(TicketDetailInit()),
      child: BlocBuilder<TicketDetailPageBloc, TicketDetailPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'Ticket Details',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Center(
                    child: Text(
                      DateFormat.yMd().format(ticket.createdAt),
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '${ticket.name}  ${ticket.createdAt.hour}:${ticket.createdAt.minute}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            TagChip(text: ticket.status, colorIndex: 9),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${ticket.title} #${ticket.number}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        ticket.text,
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: _showReplies(state),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(
                  () => TicketReplyPage(
                    ticket: ticket,
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }

  Widget _showReplies(TicketDetailPageState state) {
    Widget widget;
    if (state is TicketDetailPageSuccess) {
      widget = TicketReplies(replies: state.replies);
    } else if (state is TickeDetailPageLoading) {
      widget = Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: CircularProgressIndicator(),
      );
    } else {
      widget = Container();
    }
    return widget;
  }
}
