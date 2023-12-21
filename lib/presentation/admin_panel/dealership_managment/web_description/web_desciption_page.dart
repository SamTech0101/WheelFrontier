import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/presentation/admin_panel/dealership_managment/web_description/widgets/media_preview.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:abs_customer_sites/application/admin_panel/web_desciption/web_description_bloc.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class WebDescriptionPage extends StatelessWidget {
  final Dealership dealership;
  const WebDescriptionPage({@required this.dealership});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WebDescriptionBloc>(param1: dealership)
        ..add(WebDescriptionPageInitialized()),
      child: BlocConsumer<WebDescriptionBloc, WebDescriptionState>(
        listener: (context, state) async {
          if (state is WebDescriptionEditing) {
            if (state.apiResponse.response is Success) {
              Get.back();
            } else if (state.apiResponse.response is Exception) {
              showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message: state.apiResponse.response.toString(),
                ),
              );
            }
          } else if (state is WebDescriptionFailure) {
            showTopSnackBar(
              context,
              CustomSnackBar.error(
                message: state.exception.toString(),
              ),
            );
          }
        },
        builder: (context, state) {
          Widget widget;
          if (state is WebDescriptionInitial) {
            widget = Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is WebDescriptionEditing) {
            widget = LoadingOverlay(
              isLoading: state.waitingForApiResponse,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    'Descriptions',
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context
                            .read<WebDescriptionBloc>()
                            .add(WebDescriptionSavedButtonPressed());
                      },
                    ),
                  ],
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                body: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: BlocBuilder<WebDescriptionBloc, WebDescriptionState>(
                      builder: (context, state) {
                        Widget widget;
                        if (state is WebDescriptionInitial) {
                          widget = Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is WebDescriptionEditing) {
                          widget = SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description Video',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<WebDescriptionBloc>().add(
                                              WebDescriptionAddVideoPressed());
                                        },
                                        child: MediaPreview(
                                          bloc: context
                                              .read<WebDescriptionBloc>(),
                                          mediaType: MediaType.video,
                                          localMediaPath: state.videoThumbnail,
                                          networkMediaPath:
                                              state.response != null
                                                  ? state.response
                                                      .speechVideoScreenshot
                                                  : '',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description Image',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<WebDescriptionBloc>().add(
                                              WebDescriptionAddImagePressed());
                                        },
                                        child: MediaPreview(
                                          bloc: context
                                              .read<WebDescriptionBloc>(),
                                          mediaType: MediaType.image,
                                          localMediaPath: state.image.path,
                                          networkMediaPath:
                                              state.response != null
                                                  ? state.response.logo
                                                  : '',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _ExpansionTextField(
                                  name: 'Comment',
                                  controller: state.comment,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Why choose us?',
                                  controller: state.whyChooseUs,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Service Description',
                                  controller: state.serviceDescription,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Value Your Trade Description',
                                  controller: state.valueYourTradeDescription,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Car Finder Description',
                                  controller: state.carFinderDescription,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Loan App Description',
                                  controller: state.loanAppDescitpion,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Busines  s Caption',
                                  controller: state.businessCaption,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Part Desciption',
                                  controller: state.partDescription,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Phone Numbers',
                                  controller: state.phonenumbers,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Physical Address',
                                  controller: state.physicalAddress,
                                  minLines: 6,
                                ),
                                _ExpansionTextField(
                                  name: 'Open Days Time',
                                  controller: state.openDaysTime,
                                  minLines: 6,
                                ),
                                ExpansionTile(
                                  title: Text(
                                    'Social Media Accounts',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  children: [
                                    _SocialMediaTextField(
                                      name: 'Facebook',
                                      controller: state.facebook,
                                    ),
                                    _SocialMediaTextField(
                                      name: 'Youtube',
                                      controller: state.youtube,
                                    ),
                                    _SocialMediaTextField(
                                      name: 'Instagram',
                                      controller: state.instagram,
                                    ),
                                    _SocialMediaTextField(
                                      name: 'Twitter',
                                      controller: state.twitter,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        return widget;
                      },
                    ),
                  ),
                ),
              ),
            );
          }
          return widget;
        },
      ),
    );
  }
}

class _ExpansionTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final int minLines;
  const _ExpansionTextField({
    @required this.name,
    @required this.controller,
    @required this.minLines,
  });
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 18),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: controller,
            minLines: minLines,
            maxLines: minLines + 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialMediaTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const _SocialMediaTextField({
    @required this.name,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: controller,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
