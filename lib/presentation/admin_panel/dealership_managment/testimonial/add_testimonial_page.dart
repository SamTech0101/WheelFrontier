import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/core/init_dio.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:abs_customer_sites/application/admin_panel/dealership_managment/testimonials/add_testimonial/add_testimonial_bloc.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddTestimonialPage extends StatelessWidget {
  final Dealership dealership;
  final Testimonial testimonial;

  const AddTestimonialPage({
    @required this.dealership,
    this.testimonial,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AddTestimonialBloc>(param1: testimonial, param2: dealership),
      child: BlocConsumer<AddTestimonialBloc, AddTestimonialState>(
        listener: (context, state) async {
          final currentState = state as AddTestimonialEditing;
          if (currentState.apiResponse != null) {
            if (currentState.apiResponse.response == Success) {
              Get.back();
            } else if (currentState.apiResponse.response is Exception) {
              showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message: currentState.apiResponse.response.toString(),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          final currentState = state as AddTestimonialEditing;
          return LoadingOverlay(
            isLoading: currentState.waitingForApiResponse,
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Add a testimonial',
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(color: Colors.grey[300]),
                          child: _showImage(
                              context, testimonial, currentState.image),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: TextField(
                          controller: currentState.nameController,
                          textAlign: TextAlign.center,
                          minLines: 1,
                          maxLines: 1,
                          onChanged: (value) {
                            context
                                .read<AddTestimonialBloc>()
                                .add(AddTestimonialNameChanged(name: value));
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: currentState.commentController,
                        minLines: 9,
                        maxLines: 12,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          context.read<AddTestimonialBloc>().add(
                              AddTestimonialCommentChanged(comment: value));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CheckboxListTile(
                        title: Text('Show at home page?'),
                        value: currentState.showAtHomePage,
                        onChanged: (value) => context
                            .read<AddTestimonialBloc>()
                            .add(AddTestimonialCheckBoxChanged(value: value)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<AddTestimonialBloc>()
                                .add(AddTestimonialSaveButtonPressed());
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13.0),
                            child: Text(
                              'Save',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _showImage(
    BuildContext context, Testimonial testimonial, PickedFile image) {
  Widget widget;
  if (testimonial != null) {
    if (image != null) {
      widget = ExtendedImage.file(
        File(image.path),
        fit: BoxFit.cover,
      );
    } else {
      widget = ExtendedImage.network(
        CDNBaseUrl + testimonial.image,
        fit: BoxFit.cover,
      );
    }
  } else {
    if (image != null) {
      widget = ExtendedImage.file(
        File(image.path),
        fit: BoxFit.cover,
      );
    } else {
      widget = InkWell(
        onTap: () => context
            .read<AddTestimonialBloc>()
            .add(AddTestimonialAddImageButtonPressed()),
        borderRadius: BorderRadius.circular(60),
        child: Container(
          child: Icon(
            Icons.add_a_photo,
            size: 30,
          ),
        ),
      );
    }
  }
  return widget;
}
