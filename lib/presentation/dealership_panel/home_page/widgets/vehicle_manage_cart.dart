import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/manage_vehicle_page/manage_vehicle_page.dart';

class VehicleManageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent[100],
            borderRadius: BorderRadius.circular(15)),
        child: Material(
          elevation: 0,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              Get.to(ManageVehiclePage());
            },
            highlightColor: Colors.blueAccent,
            splashColor: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: Text(
                  'Manage Vehicles',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
