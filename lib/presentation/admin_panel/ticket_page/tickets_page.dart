import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_page/ticket_page_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/ticket_page/filters_page.dart';
import 'package:abs_customer_sites/presentation/core/ticket_page/widget/ticket_cart.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tickets',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            child: IconButton(
              color: Colors.black,
              icon: Icon(Icons.filter_alt),
              onPressed: () {
                Get.to(TicketFiltersPage());
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            ZoomDrawerController drawerController =
                getIt<ZoomDrawerController>();
            if (drawerController.isOpen()) {
              drawerController.close();
            } else {
              drawerController.open();
            }
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: BlocBuilder<TicketPageBloc, TicketPageState>(
            bloc: getIt<TicketPageBloc>()..add(TicketPageInitialized()),
            builder: (context, state) {
              Widget widget;
              if (state is TicketPageLoading || state is TicketPageInitial) {
                widget = CircularProgressIndicator();
              } else if (state is TicketPageSuccess) {
                widget = Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.tickets.length,
                        itemBuilder: (context, index) {
                          return TicketCard(ticket: state.tickets[index]);
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is TicketPageFailure) {
                widget = Center(
                  child: Text(
                    'Sorry, couldnt get what you wanted ☹️',
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                );
              }
              return widget;
            },
          ),
        ),
      ),
    );
  }
}
