import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/admin_panel/requests_page/requests_page_bloc.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/requests/widgets/text_based_filter.dart';
import 'package:abs_customer_sites/presentation/core/widgets/checkbox_list_bottomsheet.dart';
import 'package:abs_customer_sites/presentation/core/widgets/radio_list_bottom_sheet.dart';

class ContactUsFilters extends StatefulWidget {
  @override
  _ContactUsFiltersState createState() => _ContactUsFiltersState();
}

class _ContactUsFiltersState extends State<ContactUsFilters> {
  TextEditingController name;
  TextEditingController companyName;
  TextEditingController email;
  TextEditingController phoneNumber;
  TextEditingController message;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    companyName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();

    message = TextEditingController();
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
                    await checkBoxBottomSheet(
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
                    await radioListBottomSheet(
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
                      filterName: 'name',
                      controller: name,
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
                      filterName: 'comment',
                      controller: message,
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
