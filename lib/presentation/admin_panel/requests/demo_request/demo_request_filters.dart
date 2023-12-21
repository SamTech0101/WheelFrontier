import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/requests_page/requests_page_bloc.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/widgets/text_based_filter.dart';
import 'package:abs_customer_sites/presentation/core/widgets/checkbox_list_bottomsheet.dart';
import 'package:abs_customer_sites/presentation/core/widgets/radio_list_bottom_sheet.dart';

class DemoRequestFilters extends StatefulWidget {
  @override
  _DemoRequestFiltersState createState() => _DemoRequestFiltersState();
}

class _DemoRequestFiltersState extends State<DemoRequestFilters> {
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController companyName;
  TextEditingController email;
  TextEditingController phoneNumber;
  TextEditingController dealershipAddress;
  TextEditingController comment;

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    companyName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    dealershipAddress = TextEditingController();
    comment = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsPageBloc, RequestsPageState>(
      bloc: getIt<RequestsPageBloc>(),
      builder: (context, state) {
        Widget widget;
        if (state is RequestsPageSuccess) {
          widget = Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () async {
                    List list = await checkBoxBottomSheet(
                      context: context,
                      options: [Seen_Status, UnSeen_Status, Responded_Status],
                      prevChosenOptions: state.filteredStatuses,
                    );
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
                  },
                  title: Row(
                    children: [
                      Text(
                        'Date',
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
                ExpansionTile(
                  title: Text(
                    'Advanced',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  children: [
                    TextBasedFilter(
                      filterName: 'first name',
                      controller: firstName,
                    ),
                    TextBasedFilter(
                      filterName: 'last name',
                      controller: lastName,
                    ),
                    TextBasedFilter(
                      filterName: 'company name',
                      controller: companyName,
                    ),
                    TextBasedFilter(
                      filterName: 'email',
                      controller: email,
                    ),
                    TextBasedFilter(
                      filterName: 'phone number',
                      controller: phoneNumber,
                    ),
                    TextBasedFilter(
                      filterName: 'dealership address',
                      controller: dealershipAddress,
                    ),
                    TextBasedFilter(
                      filterName: 'comment',
                      controller: comment,
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return widget;
      },
    );
  }
}
