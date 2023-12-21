import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply.dart';
import 'package:intl/intl.dart';

class TicketReplies extends StatefulWidget {
  final List<TicketReply> replies;

  TicketReplies({@required this.replies});

  @override
  _TicketRepliesState createState() => _TicketRepliesState();
}

class _TicketRepliesState extends State<TicketReplies> {
  List<bool> _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = List.generate(widget.replies.length, (index) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.replies.isNotEmpty ? 'Replies' : 'No Replies',
          style: TextStyle(fontSize: 25, color: Colors.blueAccent),
        ),
        SizedBox(
          height: 10,
        ),
        ExpansionPanelList(
          elevation: 0,
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _isOpen[panelIndex] = !isExpanded;
            });
          },
          children: _replies(),
        ),
      ],
    );
  }

  List<ExpansionPanel> _replies() {
    List<ExpansionPanel> replies = [];
    for (var i = 0; i < widget.replies.length; i++) {
      replies.add(
        expansionPanel(
          widget.replies[i],
          _isOpen[i],
        ),
      );
    }
    return replies;
  }
}

ExpansionPanel expansionPanel(
  TicketReply ticketReply,
  bool isExpanded,
) {
  return ExpansionPanel(
    // backgroundColor: Colors.blue,
    headerBuilder: (context, isExpanded) => Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${ticketReply.name}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text(DateFormat.yMd().format(ticketReply.createdAt)),
                ],
              ),
            ),
            SizedBox(
              height: !isExpanded ? 10 : 0,
            ),
            !isExpanded
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      ticketReply.text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 25, right: 20),
      child: Text(ticketReply.text),
    ),
    isExpanded: isExpanded,
  );
}
