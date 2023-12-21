import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:abs_customer_sites/application/admin_panel/dealership_managment/testimonials/testimonial_list/testimonial_list_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/testimonial/add_testimonial_page.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/testimonial/testimonial_card.dart';

class TestimonialList extends StatelessWidget {
  final Dealership dealership;
  const TestimonialList({@required this.dealership});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TestimonialListBloc>(param1: dealership)
        ..add(TestimonialListInitialized()),
      child: BlocBuilder<TestimonialListBloc, TestimonialListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                'Testimonials',
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
              padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: BlocBuilder<TestimonialListBloc, TestimonialListState>(
                builder: (context, state) {
                  Widget widget;
                  if (state is TestimonialListSuccess) {
                    widget = state.testimonials.isNotEmpty
                        ? ListView.builder(
                            itemCount: state.testimonials.length,
                            itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                context.read<TestimonialListBloc>().add(
                                    TestimonialDeleted(
                                        testimonialId:
                                            state.testimonials[index].id));
                              },
                              child: TestimonialCard(
                                testimonial: state.testimonials[index],
                                dealership: dealership,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              'No Testimonials yet',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                  } else if (state is TestimonialListInitial ||
                      state is TestimonialListLoading) {
                    widget = Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return widget;
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Get.to(AddTestimonialPage(
                  dealership: dealership,
                ));
                context.read<TestimonialListBloc>().add(
                      TestimonialListInitialized(),
                    );
              },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
