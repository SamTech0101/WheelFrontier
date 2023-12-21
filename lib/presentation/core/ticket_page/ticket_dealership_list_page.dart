import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'add_ticket.dart';

class TicketDealerShipListPage extends StatefulWidget {
  @override
  _TicketDealerShipListPageState createState() =>
      _TicketDealerShipListPageState();
}

class _TicketDealerShipListPageState extends State<TicketDealerShipListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Tickets',
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
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.playlist_add_rounded),
        ),
        onPressed: () {
          Get.to(AddTicketPage());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
