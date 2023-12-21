import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/ticket_page/ticket_page_bloc.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/core/widgets/checkbox_list_bottomsheet.dart';
import 'package:abs_customer_sites/presentation/core/widgets/radio_list_bottom_sheet.dart';

class TicketFiltersPage extends StatefulWidget {
  @override
  _TicketFiltersPageState createState() => _TicketFiltersPageState();
}

class _TicketFiltersPageState extends State<TicketFiltersPage> {
  List<String> units;
  List<String> statuses;
  String dateSort;
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
        child: BlocBuilder<TicketPageBloc, TicketPageState>(
          bloc: getIt<TicketPageBloc>(),
          builder: (context, state) {
            Widget widget;
            if (state is TicketPageSuccess) {
              widget = Column(
                children: [
                  ListTile(
                    onTap: () async {
                      List list = await checkBoxBottomSheet(
                        context: context,
                        options: [Sales_Unit, Support_Unit, Admin_Unit],
                        prevChosenOptions: state.units,
                      );
                      if (list.isNotEmpty) {
                        units = list;
                      }
                    },
                    title: Row(
                      children: [
                        Text(
                          'Unit',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      List list = await checkBoxBottomSheet(
                        context: context,
                        options: [Seen_Status, UnSeen_Status, Responded_Status],
                        prevChosenOptions: state.statuses,
                      );
                      statuses = list;
                    },
                    title: Row(
                      children: [
                        Text(
                          'Status',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      String value = await radioListBottomSheet(
                        context: context,
                        options: [Date_Ascending, Date_Descending],
                        prevChosenOption: state.dateSort,
                      );
                      if (value != '') {
                        dateSort = value;
                      }
                    },
                    title: Row(
                      children: [
                        Text(
                          'Sort By Date',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        getIt<TicketPageBloc>().add(
                          TicketPageFilterChanged(
                            dateSort: dateSort,
                            units: units,
                            statuses: statuses,
                          ),
                        );
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              widget = Container();
            }
            return widget;
          },
        ),
      ),
    );
  }
}
