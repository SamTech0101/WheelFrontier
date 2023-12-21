import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/lead/lead_bloc.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/car_finder/car_finder.dart';
import 'package:abs_customer_sites/presentation/core/constants.dart';
import 'package:abs_customer_sites/presentation/core/widgets/status_tag.dart';
import 'package:abs_customer_sites/presentation/core/widgets/tag_chip.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/lead_list_page/car_finder/car_finder_details.dart';
import 'package:intl/intl.dart';

class CarFinderCard extends StatelessWidget {
  final CarFinder carFinder;
  CarFinderCard({@required this.carFinder});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadBloc, LeadState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () {
            if (carFinder.status == 'Not Seen') {
              context.read<LeadBloc>().add(
                    LeadPageUpdate(request: carFinder),
                  );
              context.read<LeadBloc>().add(
                    LeadPageInitialized(),
                  );
            }
            Get.to(
              CarFinderDetails(carFinder: carFinder),
            );
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
                          '${carFinder.user.fName} ${carFinder.user.lName}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          DateFormat.yMd().add_jm().format(carFinder.date),
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
                              'assets/images/car-finder.svg',
                              color: Color.fromRGBO(10, 255, 153, 1),
                              semanticsLabel: 'car finder',
                              height: 18,
                              width: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Car Finder',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      StatusTag(status: carFinder.status),
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
