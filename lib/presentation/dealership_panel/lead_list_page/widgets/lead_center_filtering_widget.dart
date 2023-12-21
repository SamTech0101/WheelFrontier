import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:intl/intl.dart';

class LeadCenterFilteringWidget extends StatefulWidget {
  // final Function submitFilter;
  // LeadCenterFilteringWidget(this.submitFilter);
  @override
  _LeadCenterFilteringWidgetState createState() =>
      _LeadCenterFilteringWidgetState();
}

class _LeadCenterFilteringWidgetState extends State<LeadCenterFilteringWidget> {
  DateTime selectedTime;

  void _selectedTime(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      confirmText: 'ok',
      cancelText: 'cancel',
    );

    setState(() {
      selectedTime = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> apiTypeListTitle = [
      'Book Appointment',
      'Car Finder',
      'Contact Us',
      'Order Part',
      'Service Appointment',
      'Value Trade',
    ];
    List<String> apiTypeListValue = [
      'bookApointment',
      'carFinder',
      'contactUs',
      'orderPart',
      'serviceApointment',
      'valueYourTrade',
    ];

    List<String> statusListTitle = [
      'Not Seen',
      'Seen',
      'Followed',
    ];
    List<String> statusListValue = [
      'Not Seen',
      'Seen',
      'Followed',
    ];

    final _apiTypeController = GroupController(isMultipleSelection: true);
    final _statusController = GroupController(isMultipleSelection: true);
    TextEditingController _nameController = TextEditingController();
    List apiTypeFilterList = [];
    List statusFilterList = [];

    return BlocBuilder<LeadBloc, LeadState>(
      builder: (context, state) {
        return Drawer(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),
                          width: double.infinity,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Text(
                            selectedTime != null
                                ? '${selectedTime.toLocal()}'.split(' ')[0]
                                : 'Month/Day/Year',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                        ),
                      ),
                      onPressed: () => _selectedTime(context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1,
                    ),
                    SimpleGroupedCheckbox<String>(
                      controller: _apiTypeController,
                      values: apiTypeListValue,
                      itemsTitle: apiTypeListTitle,
                      groupTitle: 'Lead Type',
                      groupTitleStyle: TextStyle(fontSize: 16),
                      onItemSelected: (selected) {
                        /*selected is a list of value that checked in checkedboxs */
                        apiTypeFilterList = selected;
                      },
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1,
                    ),
                    SimpleGroupedCheckbox<String>(
                      controller: _statusController,
                      values: statusListValue,
                      itemsTitle: statusListTitle,
                      groupTitle: 'Status',
                      groupTitleStyle: TextStyle(fontSize: 16),
                      onItemSelected: (selected) {
                        /*selected is a list of value that checked in checkedboxs */
                        statusFilterList = selected;
                      },
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*to show all lists after filtering , LeadPageInitialized call to show complete list */
                        TextButton(
                          onPressed: () {
                            context.read<LeadBloc>().add(LeadPageInitialized());
                            Get.back();
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<LeadBloc>().add(
                                  LeadPageFilter(
                                    apiTypeFilter: apiTypeFilterList,
                                    statusFilter: statusFilterList,
                                    nameFilter: _nameController.text,
                                    dateFilter: selectedTime,
                                  ),
                                );
                            selectedTime = null;
                            Get.back();
                          },
                          child: Text(
                            'submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
