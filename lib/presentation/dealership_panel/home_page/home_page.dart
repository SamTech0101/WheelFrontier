import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/home_page/widgets/dashboard_container.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/home_page/widgets/vehicle_manage_cart.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/lead_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = getIt<User>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user.hasComponent('VehicleManage')
                    ? VehicleManageCard()
                    : Container(),
                user.hasComponent('Inventory') ? _Inventory() : Container(),
                user.hasComponent('Lead') ? _Lead() : Container(),
                user.hasComponent('Styles') ? _Styles() : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Inventory',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Material(
          color: Colors.transparent,
          elevation: 0,
          child: Wrap(
            children: [
              DashboardContainer(
                title: 'Vehicles',
                count: '28',
                colorIndex: 4,
              ),
              DashboardContainer(
                title: 'Parts',
                count: '92',
                colorIndex: 4,
              ),
              DashboardContainer(
                title: 'Vehicles',
                count: '28',
                colorIndex: 4,
              ),
              DashboardContainer(
                title: 'Parts',
                count: '92',
                colorIndex: 4,
              ),
              DashboardContainer(
                title: 'Vehicles',
                count: '28',
                colorIndex: 4,
              ),
              DashboardContainer(
                title: 'Parts',
                count: '92',
                colorIndex: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Lead extends StatelessWidget {
  get colorIndex => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lead',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(LeadsPage(
                    pageName: 'See All',
                    colorIndex: colorIndex,
                  ),);
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          children: [
            DashboardContainer(
              title: 'New',
              count: '5',
              colorIndex: 1,
            ),
            DashboardContainer(
              title: 'Unassigned',
              count: '12',
              colorIndex: 1,
            ),
            DashboardContainer(
              title: 'Contracts',
              count: '20',
              colorIndex: 1,
            ),
            DashboardContainer(
              title: 'Closed',
              count: '50',
              colorIndex: 1,
            ),
            DashboardContainer(
              title: 'Contracts',
              count: '20',
              colorIndex: 1,
            ),
            DashboardContainer(
              title: 'Closed',
              count: '50',
              colorIndex: 1,
            ),
            DashboardContainer(
              title: 'test',
              count: '50',
              colorIndex: 10,
              onPressed: (){
                var dio=getIt<Dio>();
                var cookieJar=getIt<CookieJar>();
                print( "salaaaaaaaaaaaaam ${cookieJar.loadForRequest(Uri.parse("https: //test111web.ca/api/user/device/test-cookie"))}");

              },

            ),
            DashboardContainer(
              title: 'check',
              count: '50',
              colorIndex: 10,
             onPressed: (){
    var dio=getIt<Dio>();
    var cookieJar=getIt<CookieJar>();
    print( "salaaaaaaaaaaaaam ${cookieJar.loadForRequest(Uri.parse("https: //test111web.ca/api/user/device/check-cookie"))}");

    },

            ),
          ],
        ),
      ],
    );
  }
}

class _Styles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Sales',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Wrap(
          children: [
            DashboardContainer(
              title: 'New',
              count: '5',
              colorIndex: 14,
            ),
            DashboardContainer(
              title: 'Unassigned',
              count: '142',
              colorIndex: 14,
            ),
            DashboardContainer(
              title: 'Contracts',
              count: '20',
              colorIndex: 14,
            ),
            DashboardContainer(
              title: 'Closed',
              count: '50',
              colorIndex: 14,
            ),
            DashboardContainer(
              title: 'Contracts',
              count: '20',
              colorIndex: 14,
            ),
            DashboardContainer(
              title: 'Closed',
              count: '50',
              colorIndex: 14,
            ),

          ],
        ),
      ],
    );
  }
}
