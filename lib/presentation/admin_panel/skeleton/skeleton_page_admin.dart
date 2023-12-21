import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/dealership_list_page.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/requests_page.dart';
import 'package:abs_customer_sites/presentation/admin_panel/services/services_page.dart';
import 'package:abs_customer_sites/presentation/admin_panel/ticket_page/tickets_page.dart';

class SkeletonPageAdmin extends StatefulWidget {
  @override
  _SkeletonPageAdminState createState() => _SkeletonPageAdminState();
}

class _SkeletonPageAdminState extends State<SkeletonPageAdmin> {
  ZoomDrawerController drawerController;

  @override
  void initState() {
    super.initState();
    drawerController = getIt<ZoomDrawerController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: drawerController,
        style: DrawerStyle.DefaultStyle,
        menuScreen: DrawerMenu(),
        mainScreen: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: getIt<PageController>(),
            children: [
              DealershipListPage(),
              ServicesPageAdmin(),
              TicketsPage(),
              RequestsPage(),
            ],
          ),
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0,
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.grey[300],
        slideWidth: MediaQuery.of(context).size.width * .45,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  getIt<ZoomDrawerController>().close();
                  getIt<PageController>().jumpToPage(0);
                },
                child: ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text(
                    'Dealerships',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getIt<ZoomDrawerController>().close();
                  getIt<PageController>().jumpToPage(1);
                },
                child: ListTile(
                  leading: Icon(Icons.payment),
                  title: Text(
                    'Services',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getIt<ZoomDrawerController>().close();
                  getIt<PageController>().jumpToPage(2);
                },
                child: ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(
                    'Tickets',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  getIt<ZoomDrawerController>().close();
                  getIt<PageController>().jumpToPage(3);
                },
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text(
                    'Requests',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
