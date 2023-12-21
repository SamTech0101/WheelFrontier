import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/dealership-panel/purchase/purchase_cart_list.dart';

class PurchaseListPage extends StatefulWidget {
  @override
  _PurchaseListPageState createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Purchase history',
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
        child: ListView.builder(
          itemCount: PurchaseCartList().lsit.length,
          itemBuilder: (BuildContext context, int index) {
            return PurchaseCartList().lsit[index];
          },
        ),
      ),
    );
  }
}
