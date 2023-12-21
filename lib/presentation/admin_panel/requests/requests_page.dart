import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/requests_page/requests_page_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/admin-panel/request.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/demo_request/demo_request_card.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/sign_up_request/sign_up_req_card.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'filters_page.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage>
    with SingleTickerProviderStateMixin {
  String currentTab = Demo_Request;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Requests',
          style: TextStyle(color: Colors.black),
        ),
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
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => RequestFiltersPage(
                  requestType: currentTab,
                ),
              );
            },
            icon: Icon(
              Icons.filter_alt,
              color: Colors.black,
            ),
          ),
        ],
        bottom: TabBar(
          onTap: (index) {
            currentTab = _mapTabIndexToRequestType(index);
          },
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                'Demo',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                'Contact Us',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                'Registeration',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  controller: tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    RequestPageBody(requestType: Demo_Request),
                    RequestPageBody(requestType: Contact_Us_Request),
                    RequestPageBody(requestType: Registration_Request),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RequestPageBody extends StatefulWidget {
  final String requestType;
  const RequestPageBody({@required this.requestType});
  @override
  _RequestPageBodyState createState() => _RequestPageBodyState();
}

class _RequestPageBodyState extends State<RequestPageBody> {
  @override
  void initState() {
    super.initState();
    getIt<RequestsPageBloc>().add(RequestsPageInitialized());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsPageBloc, RequestsPageState>(
      bloc: getIt<RequestsPageBloc>()..add(RequestsPageInitialized()),
      listener: (context, state) {
        if (state is RequestsPageFailure) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(message: state.exception.toString()),
          );
        }
      },
      builder: (context, state) {
        Widget widget;
        if (state is RequestsPageLoading || state is RequestsPageInitial) {
          widget = Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RequestsPageSuccess) {
          widget = Container(
            height: MediaQuery.of(context).size.height,
            child: state.requests.isNotEmpty
                ? ListView.builder(
                    itemCount: state.requests.length,
                    itemBuilder: (context, index) {
                      if (state.requests[index] is SignUpRequest) {
                        return SignUpRequestCard(
                          signUpRequest: state.requests[index],
                        );
                      } else {
                        return DemoRequestCard(
                          demoRequest: state.requests[index],
                        );
                      }
                    },
                  )
                : Text(
                    'No Requests Yet',
                    style: TextStyle(fontSize: 25),
                  ),
          );
        } else if (state is RequestsPageFailure) {
          widget = Text('Sorry, Couldnt get what you wanted');
        }
        return widget;
      },
    );
  }
}

String _mapTabIndexToRequestType(int index) {
  String requestType;
  if (index == 0) {
    requestType = Demo_Request;
  } else if (index == 1) {
    requestType = Contact_Us_Request;
  } else if (index == 2) {
    requestType = Registration_Request;
  }
  return requestType;
}
