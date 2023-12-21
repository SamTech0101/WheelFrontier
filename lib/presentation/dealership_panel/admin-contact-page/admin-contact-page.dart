import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/presentation/core/ticket_page/ticket_dealership_list_page.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/purchase_page/purchase_list_page.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/services_page/services_page.dart';

class AdminContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = getIt<User>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user.hasComponent('Tickets') ? _Tickets() : Container(),
              user.hasComponent('PurchaseHistory')
                  ? _PurchaseHistory()
                  : Container(),
              user.hasComponent('Servies') ? _Services() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.blue[200]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Center(
              child: Text(
                'Tickets',
                style: TextStyle(fontSize: 22),
              ),
            ),
            splashColor: Colors.blue,
            onTap: () {
              Get.to(TicketDealerShipListPage());
            },
          ),
        ),
      ),
    );
  }
}

class _PurchaseHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.deepPurple[200]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Center(
              child: Text(
                'Purchase History',
                style: TextStyle(fontSize: 22),
              ),
            ),
            splashColor: Colors.purple,
            onTap: () {
              Get.to(PurchaseListPage());
            },
          ),
        ),
      ),
    );
  }
}

class _Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.green[200]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Center(
              child: Text(
                'Services',
                style: TextStyle(fontSize: 22),
              ),
            ),
            splashColor: Colors.green,
            onTap: () {
              Get.to(ServicesPage());
            },
          ),
        ),
      ),
    );
  }
}
