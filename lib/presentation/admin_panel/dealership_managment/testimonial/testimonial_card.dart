import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/admin_panel/dealership_managment/testimonials/testimonial_list/testimonial_list_bloc.dart';
import 'package:abs_customer_sites/core/init_dio.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/testimonial/add_testimonial_page.dart';

class TestimonialCard extends StatelessWidget {
  final Dealership dealership;
  final Testimonial testimonial;
  const TestimonialCard({
    @required this.testimonial,
    @required this.dealership,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestimonialListBloc, TestimonialListState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () async {
              await Get.to(
                AddTestimonialPage(
                  testimonial: testimonial,
                  dealership: dealership,
                ),
              );
              context.read<TestimonialListBloc>().add(
                    TestimonialListInitialized(),
                  );
            },
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      ClipRRect(
                        child: ExtendedImage.network(
                          CDNBaseUrl + testimonial.image,
                          width: 50,
                          height: 50,
                          cache: true,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(testimonial.name),
                          Text(testimonial.comment),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: InkWell(
                    onTap: () {
                      context.read<TestimonialListBloc>().add(
                            TestimonialDeleted(testimonialId: testimonial.id),
                          );
                    },
                    borderRadius: BorderRadius.circular(60),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
