import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/car_finder/car_finder.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/contact_us/contact_us.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/order_part/order_part.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/value_trade/value_trade.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/book_appointment/book_appointment_card.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/car_finder/car_finder_card.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/contact_us/contact_us_card.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/order_part/order_part_card.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/service_appointment/service_appointment_card.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/value_your_trade/value_your_tarde_card.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/widgets/lead_center_filtering_widget.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LeadsPage extends StatefulWidget {
  final String pageName;
  final int colorIndex;

  LeadsPage({@required this.pageName, @required this.colorIndex});

  @override
  _LeadsPageState createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void _openDrawer() => _drawerKey.currentState.openDrawer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeadBloc>()..add(LeadPageInitialized()),
      child: Scaffold(
        key: _drawerKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            widget.pageName,
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
          actions: [
            IconButton(
              onPressed: () {
                _openDrawer();
              },
              icon: Icon(
                Icons.sort,
                color: Colors.black,
              ),
            )
          ],
        ),
        endDrawer: LeadCenterFilteringWidget(),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocConsumer<LeadBloc, LeadState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  Widget widget;
                  if (state is LeadSuccess) {
                    widget = Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LeadOverviewCard(
                          colorIndex: leadColorIndex,
                        ),
                        Expanded(
                          child: ListView.builder(
                                  itemCount: state.leads.length,
                                  itemBuilder: (context, index) {
                                    Widget widget;
                                    if (state.leads[index]
                                        is ContactUsDealership) {
                                      widget = ContactUsDealershipCard(
                                        contactUsDealership: state.leads[index],
                                      );
                                    } else if (state.leads[index]
                                        is ValueTrade) {
                                      widget = ValueYourTradeCard(
                                        valueTrade: state.leads[index],
                                      );
                                    } else if (state.leads[index]
                                        is CarFinder) {
                                      widget = CarFinderCard(
                                        carFinder: state.leads[index],
                                      );
                                    } else if (state.leads[index]
                                        is OrderPart) {
                                      widget = OrderPartCard(
                                        orderPart: state.leads[index],
                                      );
                                    } else if (state.leads[index]
                                        is ServiceAppointment) {
                                      widget = ServiceAppointmentCard(
                                        serviceAppointment: state.leads[index],
                                      );
                                    } else if (state.leads[index]
                                        is BookAppointment) {
                                      widget = BookAppointmentCard(
                                        bookAppointment: state.leads[index],
                                      );
                                    }
                                    return widget;
                                  }),
                        ),
                      ],
                    );
                  } else if (state is LeadInitial) {
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
        /*drawer which filter the list list based on name , date , status and lead type */
        drawer: LeadCenterFilteringWidget(),
      ),
    );
  }
}

class LeadOverviewCard extends StatelessWidget {
  final int colorIndex;
  LeadOverviewCard({@required this.colorIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.primaries[colorIndex].shade50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Book appointment : 2',
                      style: TextStyle(
                          color: Colors.primaries[colorIndex].shade900,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Value your tarde : 1',
                      style: TextStyle(
                          color: Colors.primaries[colorIndex].shade900,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Car Loan Application : 0',
                      style: TextStyle(
                          color: Colors.primaries[colorIndex].shade900,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Oder Part : 3',
                      style: TextStyle(
                          color: Colors.primaries[colorIndex].shade900,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Car Finder : 2',
                      style: TextStyle(
                          color: Colors.primaries[colorIndex].shade900,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Book Service : 2',
                      style: TextStyle(
                          color: Colors.primaries[colorIndex].shade900,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
