import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/services/service_card.dart';

import 'add-service-form/add-service-form.dart';

class ServicesPageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Services',
          style: TextStyle(color: Colors.black),
        ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ServiceCardAdmin(
                  name: 'VIN Decorder',
                  description: 'You will see service description here',
                  price: 50,
                  color: Colors.amber,
                  isDeafult: true,
                ),
                ServiceCardAdmin(
                  name: 'VIN Decorder',
                  description: 'You will see service description here',
                  price: 50,
                  color: Colors.amber,
                  isDeafult: true,
                ),
                ServiceCardAdmin(
                  name: 'VIN Decorder',
                  description: 'You will see service description here',
                  price: 50,
                  color: Colors.amber,
                  isDeafult: true,
                ),
                ServiceCardAdmin(
                  name: 'VIN Decorder',
                  description: 'You will see service description here',
                  price: 50,
                  color: Colors.amber,
                  isDeafult: true,
                ),
                ServiceCardAdmin(
                  name: 'VIN Decorder',
                  description: 'You will see service description here',
                  price: 50,
                  color: Colors.amber,
                  isDeafult: true,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddServiceForm());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
