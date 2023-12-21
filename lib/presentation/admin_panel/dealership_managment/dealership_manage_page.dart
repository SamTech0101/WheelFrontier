import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/testimonial/testimonial_list.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/web_description/web_desciption_page.dart';

class DealershipManagePage extends StatelessWidget {
  final Dealership dealership;
  const DealershipManagePage({
    @required this.dealership,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          dealership.bussinessName,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Wrap(
          children: [
            _FeatureCard(
              iconData: Icons.adb_sharp,
              name: 'Testimonial',
              onPressed: () => Get.to(
                TestimonialList(
                  dealership: dealership,
                ),
              ),
            ),
            _FeatureCard(
              iconData: Icons.assignment,
              name: 'Web Description',
              onPressed: () {
                Get.to(
                  WebDescriptionPage(dealership: dealership),
                );
              },
            ),
            _FeatureCard(
              iconData: Icons.aspect_ratio,
              name: 'Services',
              onPressed: () {},
            ),
            _FeatureCard(
              iconData: Icons.aspect_ratio,
              name: 'Services',
              onPressed: () {},
            ),
            _FeatureCard(
              iconData: Icons.aspect_ratio,
              name: 'Services',
              onPressed: () {},
            ),
            _FeatureCard(
              iconData: Icons.aspect_ratio,
              name: 'Services',
              onPressed: () {},
            ),
            _FeatureCard(
              iconData: Icons.aspect_ratio,
              name: 'Services',
              onPressed: () {},
            ),
            _FeatureCard(
              iconData: Icons.aspect_ratio,
              name: 'Services',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData iconData;
  final String name;
  final VoidCallback onPressed;
  const _FeatureCard({
    @required this.iconData,
    @required this.name,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 15),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 24,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                iconData,
                size: 40,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
