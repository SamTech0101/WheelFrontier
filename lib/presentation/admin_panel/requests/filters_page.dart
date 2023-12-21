import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/admin-panel/request.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/demo_request/demo_request_filters.dart';

class RequestFiltersPage extends StatelessWidget {
  final String requestType;

  RequestFiltersPage({@required this.requestType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Filters',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: _getRequestFilters(requestType),
      ),
    );
  }
}

Widget _getRequestFilters(String requestType) {
  if (requestType == Demo_Request) {
    return DemoRequestFilters();
  } else {
    return Container();
  }
}
