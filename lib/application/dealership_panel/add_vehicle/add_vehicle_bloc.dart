import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/dealership-panel/car.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'add_vehicle_event.dart';
part 'add_vehicle_state.dart';

// this bloc also uses HydratedBloc for being able to cache state

class AddVehicleBloc extends HydratedBloc<AddVehicleEvent, AddVehicleState> {
  AddVehicleBloc() : super(AddVehicleSucess.initial());

  @override
  Stream<AddVehicleState> mapEventToState(
    AddVehicleEvent event,
  ) async* {
    AddVehicleSucess currentState = state as AddVehicleSucess;
    if (event is VinIsChanged) {
      Car car = currentState.car.copyWith(vin: event.vinNumber);
      yield currentState.copyWith(car: car);
    } else if (event is YearIsChanged) {
      Car car = currentState.car.copyWith(year: event.year);
      yield currentState.copyWith(car: car);
    } else if (event is MakeIsChanged) {
      Car car = currentState.car.copyWith(make: event.make);
      yield currentState.copyWith(car: car);
    } else if (event is ModelIsChanged) {
      Car car = currentState.car.copyWith(model: event.model);
      yield currentState.copyWith(car: car);
    } else if (event is TransmissionIsChanged) {
      Car car = currentState.car.copyWith(transmission: event.transmission);
      yield currentState.copyWith(car: car);
    } else if (event is FuelTypeIsChanged) {
      Car car = currentState.car.copyWith(fuelType: event.fuel);
      yield currentState.copyWith(car: car);
    } else if (event is ConditionIsChanged) {
      Car car = currentState.car.copyWith(condition: event.condition);
      yield currentState.copyWith(car: car);
    } else if (event is BodyStyleIsChanged) {
      Car car = currentState.car.copyWith(bodyStyle: event.bodyStyle);
      yield currentState.copyWith(car: car);
    } else if (event is TrimIsChanged) {
      Car car = currentState.car.copyWith(trim: event.trim);
      yield currentState.copyWith(car: car);
    } else if (event is EngineModelIsChanged) {
      Car car = currentState.car.copyWith(engine: event.engine);
      yield currentState.copyWith(car: car);
    } else if (event is EngineSizeIschanged) {
      Car car = currentState.car.copyWith(engineSize: event.engineSize);
      yield currentState.copyWith(car: car);
    } else if (event is ExteriorColorIsChanged) {
      Car car = currentState.car.copyWith(exteriorColor: event.exteriorColor);
      yield currentState.copyWith(car: car);
    } else if (event is CarfaxLinkIsChanged) {
      Car car = currentState.car.copyWith(carFaxLink: event.carfaxLnk);
      yield currentState.copyWith(car: car);
    } else if (event is EtestIsChanged) {
      Car car = currentState.car.copyWith(eTest: event.eTest);
      yield currentState.copyWith(car: car);
    } else if (event is PriceIsChanged) {
      Car car = currentState.car.copyWith(price: event.price);
      yield currentState.copyWith(car: car);
    } else if (event is SpecialPriceIsChanged) {
      Car car = currentState.car.copyWith(specialPricel: event.specialPrice);
      yield currentState.copyWith(car: car);
    } else if (event is MsrpIsChanged) {
      Car car = currentState.car.copyWith(msrp: event.msrp);
      yield currentState.copyWith(car: car);
    } else if (event is PaymentIsChanged) {
      Car car = currentState.car.copyWith(payment: event.payment);
      yield currentState.copyWith(car: car);
    } else if (event is WarrantyIsChanged) {
      Car car = currentState.car.copyWith(waranty: event.warranty);
      yield currentState.copyWith(car: car);
    } else if (event is DealerCommentIsChanged) {
      Car car = currentState.car.copyWith(dealerComment: event.dealerComment);
      yield currentState.copyWith(car: car);
    } else if (event is DescriptionIsChanged) {
      Car car = currentState.car.copyWith(description: event.description);
      yield currentState.copyWith(car: car);
    } else if (event is FrontMainImageIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.frontMainPhoto.toMutableList();
      updatedMainPhotoList.add(event.frontMainImages);
      Car updatedCar =
          currentState.car.copyWith(frontMainPhoto: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is FrontImageIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.frontPhotos.toMutableList();
      updatedMainPhotoList.add(event.frontImages);
      Car updatedCar =
          currentState.car.copyWith(frontPhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is DriverSideImageIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.driverSidePhotos.toMutableList();
      updatedMainPhotoList.add(event.driverSidesImages);
      Car updatedCar =
          currentState.car.copyWith(driverSidePhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is PassengerSideImageIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.passengerSidePhotos.toMutableList();
      updatedMainPhotoList.add(event.passengerSideImages);
      Car updatedCar =
          currentState.car.copyWith(passengerSidePhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is TireImageIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.tirePhotos.toMutableList();
      updatedMainPhotoList.add(event.tireImages);
      Car updatedCar =
          currentState.car.copyWith(tirePhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is InteriorDriverSideImageIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.interiorDriverSidePhotos.toMutableList();
      updatedMainPhotoList.add(event.interiorSideImages);
      Car updatedCar = currentState.car
          .copyWith(interiorDriverSidePhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is DashboardImagesIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.dashboardPhotos.toMutableList();
      updatedMainPhotoList.add(event.dashboardImages);
      Car updatedCar =
          currentState.car.copyWith(dashboardPhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is ConsoleImagesIsChanged) {
      if (currentState.shouldShowMessage) {
        /////////////////////////////////////
      }
      KtMutableList<File> updatedMainPhotoList =
          currentState.car.consolePhotos.toMutableList();
      updatedMainPhotoList.add(event.consoleImages);
      Car updatedCar =
          currentState.car.copyWith(consolePhotos: updatedMainPhotoList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is SubmitButtomIsPeressed) {
      ////////////////////////////////////////
    } else if (event is FrontMianImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.frontMainPhoto.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar = currentState.car.copyWith(frontMainPhoto: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is FrontImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.frontPhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar = currentState.car.copyWith(frontPhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is DriverSideImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.driverSidePhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar = currentState.car.copyWith(driverSidePhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is PassengerSideImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.passengerSidePhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar =
          currentState.car.copyWith(passengerSidePhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is TireImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.tirePhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar = currentState.car.copyWith(tirePhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is InteriorDriverSideImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.interiorDriverSidePhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar =
          currentState.car.copyWith(interiorDriverSidePhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is DashboardImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.dashboardPhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar = currentState.car.copyWith(dashboardPhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is ConsoleImageIsDeleted) {
      KtMutableList<File> updatedList =
          currentState.car.consolePhotos.toMutableList();
      updatedList.remove(event.imageFile);
      Car updatedCar = currentState.car.copyWith(consolePhotos: updatedList);
      yield currentState.copyWith(car: updatedCar);
    } else if (event is VideoAdded) {
      // craeting a thumbnail out of video for showing to user
      String thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: event.videoPath,
        thumbnailPath: (await getApplicationDocumentsDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        quality: 75,
      );
      yield currentState.copyWith(
        videoPath: event.videoPath,
        videoThumbnailPath: thumbnailPath,
      );
    } else if (event is VideoDeleted) {
      await File(event.videoPath).delete();
      yield currentState.copyWith(
        videoPath: '',
        videoThumbnailPath: '',
      );
    }
  }

  String validateVin(int vin) {
    if (vin == null) {
      return 'please enter VIN number';
    } else
      return null;
  }

  String validateYear(int year) {
    if (year == null) {
      return 'please enter Year of car';
    } else
      return null;
  }

  String validateMake(String make) {
    if (make == null) {
      return 'please enter Make of car';
    } else
      return null;
  }

  String validateTransmission(String transmission) {
    if (transmission == null) {
      return 'please enter transmission of car';
    } else
      return null;
  }

  String validatefuelType(String fueltype) {
    if (fueltype == null) {
      return 'please enter fuel type of car';
    } else
      return null;
  }

  String validateCondition(String condition) {
    if (condition == null) {
      return 'please enter condition of car';
    } else
      return null;
  }

  String validateBodyStyle(String bodyStyle) {
    if (bodyStyle == null) {
      return 'please enter body style of car';
    } else
      return null;
  }

  String validateTrim(String trim) {
    if (trim == null) {
      return 'please enter trim of car';
    } else
      return null;
  }

  String validateEngineModel(String engineModel) {
    if (engineModel == null) {
      return 'please enter engine model of car';
    } else
      return null;
  }

  String validateEngineSize(String engineSize) {
    if (engineSize == null) {
      return 'please enter engine size of car';
    } else
      return null;
  }

  String validateExteriorColor(String exteriorColor) {
    if (exteriorColor == null) {
      return 'please enter exterior color of car';
    } else
      return null;
  }

  String validateCarfaxLink(String carfaxLink) {
    if (carfaxLink == null) {
      return 'please enter carfax link of car';
    } else
      return null;
  }

  String validateEtest(String eTest) {
    if (eTest == null) {
      return 'please enter E test of car';
    } else
      return null;
  }

  String validatePrice(int price) {
    if (price == null) {
      return 'please enter price of car';
    } else
      return null;
  }

  String validateSpecialPrice(int specialPrice) {
    if (specialPrice == null) {
      return 'please enter special price of car';
    } else
      return null;
  }

  String validateMSRP(int msrp) {
    if (msrp == null) {
      return 'please enter msrp of car';
    } else
      return null;
  }

  String validatePayment(int payment) {
    if (payment == null) {
      return 'please enter payment of car';
    } else
      return null;
  }

  String validateWarranty(String warranty) {
    if (warranty == null) {
      return 'please enter warranty of car';
    } else
      return null;
  }

  String validateDealerComment(String dealerComment) {
    if (dealerComment == null) {
      return 'please enter dealer comment of car';
    } else
      return null;
  }

  String validateDescription(String description) {
    if (description == null) {
      return 'please enter description of car';
    } else
      return null;
  }

  String validateFrontMainImage(File frontMainImage) {
    if (frontMainImage == null) {
      return 'please insert front main image';
    } else
      return null;
  }

  String validateFrontImages(List<File> frontImages) {
    if (frontImages.isEmpty) {
      return 'please insert front images';
    } else
      return null;
  }

  String validateDriverSideImages(List<File> drivrSideImages) {
    if (drivrSideImages.isEmpty) {
      return 'please insert driver side images';
    } else
      return null;
  }

  String validatePassengerSideImages(List<File> passengerSideImages) {
    if (passengerSideImages.isEmpty) {
      return 'please insert passenger side images';
    } else
      return null;
  }

  String validateTireImages(List<File> tireImages) {
    if (tireImages.isEmpty) {
      return 'please insert tire images';
    } else
      return null;
  }

  String validateInteriorDriverSideImages(List<File> interiorDriverSideImages) {
    if (interiorDriverSideImages.isEmpty) {
      return 'please insert interior driver side images';
    } else
      return null;
  }

  String validateDashboardImages(List<File> dashboardImage) {
    if (dashboardImage.isEmpty) {
      return 'please insert dashboard images';
    } else
      return null;
  }

  String validateConsoleImages(List<File> consoleImages) {
    if (consoleImages.isEmpty) {
      return 'please insert console images';
    } else
      return null;
  }

  @override
  AddVehicleState fromJson(Map<String, dynamic> json) {
    try {
      final AddVehicleSucess addVehicleSucess = AddVehicleSucess.fromMap(json);
      return addVehicleSucess;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(AddVehicleState state) {
    if (state is AddVehicleSucess) {
      return state.toMap();
    } else {
      return null;
    }
  }
}

enum PictureCategory {
  frontMainImageIsChanged,
  frontImageIsChanged,
  driverSideImageIsChanged,
  passengerSideImageIsChanged,
  tireImageIsChanged,
  interiorDriverSideImageIsChanges,
  dashboardImagesIsChanged,
  consoleImagesIsChanged
}
