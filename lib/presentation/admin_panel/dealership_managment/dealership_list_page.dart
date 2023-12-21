import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/dealership_managment/dealership_list/dealership_list_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/dealership_manage_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DealershipListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DealershipListBloc>()..add(DealershipListInitialized()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Dealerships',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: BlocConsumer<DealershipListBloc, DealershipListState>(
              listener: (context, state) {
                if (state is DealershipListFailure) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(message: state.exception.toString()),
                  );
                }
              },
              builder: (context, state) {
                Widget widget;
                if (state is DealershipListSuccess) {
                  widget = Column(
                    children: [
                      TextField(
                        onChanged: (value) => context
                            .read<DealershipListBloc>()
                            .add(DealershipListSearchTermChanged(text: value)),
                        decoration: InputDecoration(
                          focusColor: Colors.transparent,
                          fillColor: Colors.transparent,
                          hintText: 'Search',
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.dealerships.size,
                          itemBuilder: (context, index) => DealershipCard(
                            dealership: state.dealerships[index],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is DealershipListInitial ||
                    state is DealershipListLoading) {
                  widget = Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return widget;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DealershipCard extends StatelessWidget {
  final Dealership dealership;
  const DealershipCard({
    @required this.dealership,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(DealershipManagePage(dealership: dealership));
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  dealership.bussinessName,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  dealership.id.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
