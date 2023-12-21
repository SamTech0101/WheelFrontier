import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_reply/ticket_reply_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/presentation/admin_panel/ticket_page/widgets/attached_file_card.dart';

class TicketReplyPage extends StatelessWidget {
  final Ticket ticket;

  TicketReplyPage({@required this.ticket});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketReplyBloc>(param1: ticket),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Reply',
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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: BlocConsumer<TicketReplyBloc, TicketReplyState>(
              listener: (context, state) async {
                if (state is TicketReplyEditing) {
                  if (state.attachedInvalidFile) {
                    await showOkAlertDialog(
                      context: context,
                      title: 'Invalid file format',
                      message: 'Attached file format is not supported',
                    );
                  }
                }
              },
              builder: (context, state) {
                Widget widget;
                if (state is TicketReplyEditing) {
                  widget = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: state.descriptionController,
                        minLines: 7,
                        maxLines: 15,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          context
                              .read<TicketReplyBloc>()
                              .add(TicketReplyTextChanged(text: value));
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Attachments :',
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<TicketReplyBloc>()
                                    .add(TicketReplyAddFileButtonPressed());
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.attachedFiles.size,
                          itemBuilder: (context, index) => AttachedFileCard(
                            file: state.attachedFiles[index],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<TicketReplyBloc>()
                                .add(TicketReplySendButtonPressed());
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0),
                            child: Text(
                              'Send',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  widget = Container();
                }
                return widget;
              },
            ),
          ),
        ),
      ),
    );
  }
}
