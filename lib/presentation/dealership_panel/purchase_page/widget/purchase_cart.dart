import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PurchaseCart extends StatelessWidget {
  final int servicesCount;
  final String serviceStatus;
  final int total;
  final String date;

  PurchaseCart({
    this.date,
    this.serviceStatus,
    this.servicesCount = 0,
    this.total = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.purple[300]),
            borderRadius: BorderRadius.circular(15)),
        height: 120,
        width: MediaQuery.of(context).size.width * (8 / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 5, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      servicesCount.toString() + 'services',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 5),
              child: Text(
                'status : ' + serviceStatus,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25, bottom: 5),
                  child: Text('total : ' + total.toString() + '\$'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
