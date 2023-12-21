import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/admin-contact-page/admin-contact-page.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/home_page/home_page.dart';

class SkeletonPageDealership extends StatefulWidget {
  @override
  _SkeletonPageDealershipState createState() => _SkeletonPageDealershipState();
}

class _SkeletonPageDealershipState extends State<SkeletonPageDealership> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: getIt<PageController>(),
        children: [
          AdminContactPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        snakeViewColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => {
              _selectedIndex = index,
              getIt<PageController>().jumpToPage(index),
            }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        ],
      ),
    );
  }
}
