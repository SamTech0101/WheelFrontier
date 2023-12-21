import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/contact_us/contact_us.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/value_trade/value_trade.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:abs_customer_sites/presentation/core/widgets/status_tag.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/contact_us/contact_us_detail.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/value_your_trade/value_your_trade_details.dart';
import 'package:intl/intl.dart';

class ValueYourTradeCard extends StatelessWidget {
  final ValueTrade valueTrade;
  ValueYourTradeCard({@required this.valueTrade});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadBloc, LeadState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () {
            if (valueTrade.status == 'Not Seen') {
              context.read<LeadBloc>().add(LeadPageUpdate(request: valueTrade));
              context.read<LeadBloc>().add(LeadPageInitialized());
            }
            Get.to(ValueYourTradeDetails(valueTrade: valueTrade));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.primaries[leadColorIndex],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${valueTrade.user.fName} ${valueTrade.user.lName}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          DateFormat.yMd().add_jm().format(valueTrade.date),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/value-trade.svg',
                              color: Color.fromRGBO(20, 125, 245, 1),
                              semanticsLabel: 'value trade',
                              height: 18,
                              width: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Value Your Trade',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      StatusTag(status: valueTrade.status),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
