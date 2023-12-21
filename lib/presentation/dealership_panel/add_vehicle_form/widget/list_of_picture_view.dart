import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/add_vehicle/add_vehicle_bloc.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/add_vehicle_form/image_page_veiw.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/add_vehicle_form/widget/custom_photo_container.dart';
import 'package:kt_dart/collection.dart';

class ListOfPicturesView extends StatelessWidget {
  final PictureCategory pictureCategory;
  final KtList<File> listOfPictures;

  ListOfPicturesView({
    this.pictureCategory,
    this.listOfPictures,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
        builder: (context, state) {
      AddVehicleSucess currentState = state as AddVehicleSucess;

      return Container(
        height: 85,
        width: MediaQuery.of(context).size.width - 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listOfPictures.size,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Get.to(
                        ImageViewPage(
                          file: listOfPictures[index],
                        ),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomPhotoContainer(
                        file: listOfPictures[index],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: InkWell(
                      onTap: () {
                        if (pictureCategory ==
                            PictureCategory.frontMainImageIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              FrontMianImageIsDeleted(
                                  imageFile:
                                      currentState.car.frontMainPhoto[index]));
                        } else if (pictureCategory ==
                            PictureCategory.frontImageIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              FrontImageIsDeleted(
                                  imageFile:
                                      currentState.car.frontPhotos[index]));
                        } else if (pictureCategory ==
                            PictureCategory.driverSideImageIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              DriverSideImageIsDeleted(
                                  imageFile: currentState
                                      .car.driverSidePhotos[index]));
                        } else if (pictureCategory ==
                            PictureCategory.passengerSideImageIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              PassengerSideImageIsDeleted(
                                  imageFile: currentState
                                      .car.passengerSidePhotos[index]));
                        } else if (pictureCategory ==
                            PictureCategory.tireImageIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              TireImageIsDeleted(
                                  imageFile:
                                      currentState.car.tirePhotos[index]));
                        } else if (pictureCategory ==
                            PictureCategory.interiorDriverSideImageIsChanges) {
                          return context.read<AddVehicleBloc>().add(
                              InteriorDriverSideImageIsDeleted(
                                  imageFile: currentState
                                      .car.interiorDriverSidePhotos[index]));
                        } else if (pictureCategory ==
                            PictureCategory.dashboardImagesIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              DashboardImageIsDeleted(
                                  imageFile:
                                      currentState.car.dashboardPhotos[index]));
                        } else if (pictureCategory ==
                            PictureCategory.consoleImagesIsChanged) {
                          return context.read<AddVehicleBloc>().add(
                              ConsoleImageIsDeleted(
                                  imageFile:
                                      currentState.car.consolePhotos[index]));
                        }
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
