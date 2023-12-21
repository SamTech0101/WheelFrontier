import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/dealership_panel/add_vehicle/add_vehicle_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_mode.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/core/widgets/radio_list_bottom_sheet.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/add_vehicle_form/widget/add_picture_button.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/add_vehicle_form/widget/counter_of_pictures.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/add_vehicle_form/widget/list_of_picture_view.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/camera_view.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/video_playback_view.dart';

final addVehicleKey = GlobalKey<FormState>();

class AddVehicleForm extends StatefulWidget {
  @override
  _AddVehicleFormState createState() => _AddVehicleFormState();
}

class _AddVehicleFormState extends State<AddVehicleForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddVehicleBloc>(
      create: (context) => getIt<AddVehicleBloc>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Add Vehicle',
            style: TextStyle(color: Colors.black),
          ),
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
          child: BlocBuilder<AddVehicleBloc, AddVehicleState>(
            builder: (context, state) {
              AddVehicleSucess currentState = state as AddVehicleSucess;

              return SingleChildScrollView(
                child: Form(
                  key: addVehicleKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            'Vehicle',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.vinController,
                          decoration: InputDecoration(hintText: 'VIN'),
                          validator: (value) {
                            if (value.isEmpty) return 'You have to insert VIN';
                            return null;
                          },
                          onChanged: (value) {
                            context
                                .read<AddVehicleBloc>()
                                .add(VinIsChanged(vinNumber: value));
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.yearController,
                          decoration: InputDecoration(hintText: 'Year'),
                          validator: (value) {
                            if (value.isEmpty) return 'You have to insert year';
                            return null;
                          },
                          onChanged: (value) {
                            context
                                .read<AddVehicleBloc>()
                                .add(YearIsChanged(year: value));
                          },
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) => {},
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          String result = await radioListBottomSheet(
                              context: context,
                              options: [
                                'Suv',
                                'Sedan',
                                'Coupe',
                                'Cross over',
                                'Truck',
                                'Convertible'
                              ]);
                          if (result != '') {
                            context
                                .read<AddVehicleBloc>()
                                .add(MakeIsChanged(make: result));
                          }
                        },
                        title: Text(
                          'Make',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        subtitle: currentState.car.make != null
                            ? Text(currentState.car.make)
                            : Container(),
                      ),
                      ListTile(
                        onTap: () async {
                          String result = await radioListBottomSheet(
                            context: context,
                            options: ['M6', 'M5', 'M4', 'M3', 'M2', 'M1'],
                          );
                          context
                              .read<AddVehicleBloc>()
                              .add(ModelIsChanged(model: result));
                        },
                        title: Text(
                          'Model',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        subtitle: currentState.car.model != null
                            ? Text(currentState.car.model)
                            : Container(),
                      ),
                      ListTile(
                        onTap: () async {
                          String result = await radioListBottomSheet(
                            context: context,
                            options: [
                              'Manual',
                              'Automatic',
                            ],
                          );
                          context
                              .read<AddVehicleBloc>()
                              .add(TransmissionIsChanged(transmission: result));
                        },
                        title: Text(
                          'Transmission',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        subtitle: currentState.car.transmission != null
                            ? Text(currentState.car.transmission)
                            : Container(),
                      ),
                      ListTile(
                        onTap: () async {
                          String result = await radioListBottomSheet(
                            context: context,
                            options: [
                              'Diesel',
                              'Hybrid',
                              'Electric',
                              'Alternative'
                            ],
                          );
                          context
                              .read<AddVehicleBloc>()
                              .add(FuelTypeIsChanged(fuel: result));
                        },
                        title: Text(
                          'Fuel Type',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        subtitle: currentState.car.fuelType != null
                            ? Text(currentState.car.fuelType)
                            : Container(),
                      ),
                      ListTile(
                        onTap: () async {
                          String result = await radioListBottomSheet(
                              context: context,
                              options: [
                                'Excellent',
                                'Good',
                                'Fair',
                                'Poor',
                              ]);
                          context
                              .read<AddVehicleBloc>()
                              .add(ConditionIsChanged(condition: result));
                        },
                        title: Text(
                          'Condition',
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        subtitle: currentState.car.condition != null
                            ? Text(currentState.car.condition)
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.bodyStyleController,
                          decoration: InputDecoration(hintText: 'Body Style'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  BodyStyleIsChanged(bodyStyle: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.trimController,
                          decoration: InputDecoration(hintText: 'Trim'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';

                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  TrimIsChanged(trim: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.engineController,
                          decoration: InputDecoration(hintText: 'Engine'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';

                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  EngineModelIsChanged(engine: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.engineSizeController,
                          decoration: InputDecoration(hintText: 'Engine size'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';

                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  EngineSizeIschanged(engineSize: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.exteriorColorController,
                          decoration:
                              InputDecoration(hintText: 'Exterior Color'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';

                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  ExteriorColorIsChanged(exteriorColor: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.carFaxLinkController,
                          decoration: InputDecoration(hintText: 'Carfax link'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  CarfaxLinkIsChanged(carfaxLnk: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.eTestController,
                          decoration: InputDecoration(hintText: 'E test'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  EtestIsChanged(eTest: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            'Financial',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.priceController,
                          decoration: InputDecoration(hintText: 'Price'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  PriceIsChanged(price: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.specialPricelController,
                          decoration:
                              InputDecoration(hintText: 'Special Price'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  SpecialPriceIsChanged(specialPrice: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.msrpController,
                          decoration: InputDecoration(hintText: 'MSRP'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  MsrpIsChanged(msrp: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.paymentController,
                          decoration: InputDecoration(hintText: 'Payment'),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  PaymentIsChanged(payment: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            'Other',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.warantyController,
                          minLines: 4,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Warranty',
                          ),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  WarrantyIsChanged(warranty: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.dealerCommentController,
                          minLines: 4,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Dealer Comment',
                          ),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  DealerCommentIsChanged(dealerComment: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: currentState.descriptionController,
                          minLines: 4,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Description',
                          ),
                          validator: (value) {
                            if (value.isEmpty)
                              return 'You have to insert a name';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            context.read<AddVehicleBloc>().add(
                                  DescriptionIsChanged(description: value),
                                )
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Front :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AddPictureButton(
                                          onPeresed: () async {
                                            File file1 = await Get.to(
                                                CameraView(
                                                    cameraMode:
                                                        CameraMode.picture));

                                            if (file1 != null) {
                                              return context
                                                  .read<AddVehicleBloc>()
                                                  .add(FrontImageIsChanged(
                                                      frontImages: file1));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          top: -14,
                                          right: -14,
                                          child: CounterOfPicturesWidget(
                                            listOfPictures:
                                                currentState.car.frontPhotos,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ListOfPicturesView(
                                      listOfPictures:
                                          currentState.car.frontPhotos,
                                      pictureCategory:
                                          PictureCategory.frontImageIsChanged,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Driver Side :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AddPictureButton(
                                          onPeresed: () async {
                                            File file1 = await Get.to(
                                                CameraView(
                                                    cameraMode:
                                                        CameraMode.picture));

                                            if (file1 != null) {
                                              return context
                                                  .read<AddVehicleBloc>()
                                                  .add(DriverSideImageIsChanged(
                                                      driverSidesImages:
                                                          file1));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          top: -14,
                                          right: -14,
                                          child: CounterOfPicturesWidget(
                                            listOfPictures: currentState
                                                .car.driverSidePhotos,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ListOfPicturesView(
                                      listOfPictures:
                                          currentState.car.driverSidePhotos,
                                      pictureCategory: PictureCategory
                                          .driverSideImageIsChanged,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    'Passenger Side :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AddPictureButton(
                                          onPeresed: () async {
                                            File file1 = await Get.to(
                                                CameraView(
                                                    cameraMode:
                                                        CameraMode.picture));

                                            if (file1 != null) {
                                              return context
                                                  .read<AddVehicleBloc>()
                                                  .add(
                                                      PassengerSideImageIsChanged(
                                                          passengerSideImages:
                                                              file1));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          top: -14,
                                          right: -14,
                                          child: CounterOfPicturesWidget(
                                            listOfPictures: currentState
                                                .car.passengerSidePhotos,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ListOfPicturesView(
                                      listOfPictures:
                                          currentState.car.passengerSidePhotos,
                                      pictureCategory: PictureCategory
                                          .passengerSideImageIsChanged,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Tire :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AddPictureButton(
                                          onPeresed: () async {
                                            File file1 = await Get.to(
                                                CameraView(
                                                    cameraMode:
                                                        CameraMode.picture));

                                            if (file1 != null) {
                                              return context
                                                  .read<AddVehicleBloc>()
                                                  .add(TireImageIsChanged(
                                                      tireImages: file1));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          top: -14,
                                          right: -14,
                                          child: CounterOfPicturesWidget(
                                            listOfPictures:
                                                currentState.car.tirePhotos,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ListOfPicturesView(
                                      listOfPictures:
                                          currentState.car.tirePhotos,
                                      pictureCategory:
                                          PictureCategory.tireImageIsChanged,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Interior Driver Side :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AddPictureButton(
                                          onPeresed: () async {
                                            File file1 = await Get.to(
                                                CameraView(
                                                    cameraMode:
                                                        CameraMode.picture));

                                            if (file1 != null) {
                                              return context
                                                  .read<AddVehicleBloc>()
                                                  .add(
                                                      InteriorDriverSideImageIsChanged(
                                                          interiorSideImages:
                                                              file1));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          top: -14,
                                          right: -14,
                                          child: CounterOfPicturesWidget(
                                            listOfPictures: currentState
                                                .car.interiorDriverSidePhotos,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ListOfPicturesView(
                                      listOfPictures: currentState
                                          .car.interiorDriverSidePhotos,
                                      pictureCategory: PictureCategory
                                          .interiorDriverSideImageIsChanges,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Dashboard :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AddPictureButton(
                                          onPeresed: () async {
                                            File file1 = await Get.to(
                                                CameraView(
                                                    cameraMode:
                                                        CameraMode.picture));

                                            if (file1 != null) {
                                              return context
                                                  .read<AddVehicleBloc>()
                                                  .add(DashboardImagesIsChanged(
                                                      dashboardImages: file1));
                                            }
                                          },
                                        ),
                                        Positioned(
                                          top: -14,
                                          right: -14,
                                          child: CounterOfPicturesWidget(
                                            listOfPictures: currentState
                                                .car.dashboardPhotos,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ListOfPicturesView(
                                      listOfPictures:
                                          currentState.car.dashboardPhotos,
                                      pictureCategory: PictureCategory
                                          .dashboardImagesIsChanged,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Material(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Console :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(clipBehavior: Clip.none, children: [
                                    AddPictureButton(
                                      onPeresed: () async {
                                        File file1 = await Get.to(CameraView(
                                            cameraMode: CameraMode.picture));

                                        if (file1 != null) {
                                          return context
                                              .read<AddVehicleBloc>()
                                              .add(ConsoleImagesIsChanged(
                                                  consoleImages: file1));
                                        }
                                      },
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: -14,
                                      child: CounterOfPicturesWidget(
                                        listOfPictures:
                                            currentState.car.consolePhotos,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ListOfPicturesView(
                                    listOfPictures:
                                        currentState.car.consolePhotos,
                                    pictureCategory:
                                        PictureCategory.consoleImagesIsChanged,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Material(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Video :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (currentState.videoPath == '') {
                                    File video = await Get.to(
                                      CameraView(cameraMode: CameraMode.video),
                                    );
                                    if (video != null) {
                                      context.read<AddVehicleBloc>().add(
                                          VideoAdded(videoPath: video.path));
                                    }
                                  } else {
                                    await Get.to(VideoPlaybackView(
                                        video: File(currentState.videoPath)));
                                  }
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey[300],
                                      child: currentState.videoThumbnailPath ==
                                              ''
                                          ? Icon(
                                              Icons.video_call_outlined,
                                              size: 50,
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(currentState
                                                      .videoThumbnailPath),
                                                  fit: BoxFit.cover,
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white38,
                                                    ),
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      size: 40,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                    ),
                                    currentState.videoPath != ''
                                        ? Positioned(
                                            top: -10,
                                            right: -10,
                                            child: GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<AddVehicleBloc>()
                                                    .add(
                                                      VideoDeleted(
                                                          videoPath:
                                                              currentState
                                                                  .videoPath),
                                                    );
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red,
                                                ),
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              addVehicleKey.currentState.validate();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
