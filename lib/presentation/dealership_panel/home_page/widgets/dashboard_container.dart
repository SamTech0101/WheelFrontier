import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/lead_list_page.dart';

class DashboardContainer extends StatelessWidget {
  final String title;
  final String count;
  final int colorIndex;
  final GestureTapCallback onPressed;

  DashboardContainer(
      {@required this.title, @required this.count, @required this.colorIndex,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 5),
      child: Container(
        width: (MediaQuery.of(context).size.width - 40) / 3,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.primaries[colorIndex],
        ),
        child: Material(
          color: Colors.transparent,
          elevation: 0,
          child: InkWell(
            onTap: () {onPressed;
              /*Todo: implement filtering based on {New , unassigned , Contracts , Closed , ... , ... } resquest states  */
            },
            highlightColor: Colors.primaries[colorIndex].shade900,
            splashColor: Colors.primaries[colorIndex].shade900,
            borderRadius: BorderRadius.circular(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  count,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
