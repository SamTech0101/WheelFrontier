part of 'add_vehicle_bloc.dart';

@immutable
abstract class AddVehicleState {}

class AddVehicleInitial extends AddVehicleState {}

class AddVehicleSucess extends AddVehicleState {
  final Car car;
  final bool shouldShowMessage;
  final String videoPath;
  final String videoThumbnailPath;
  final TextEditingController vinController;
  final TextEditingController yearController;
  final TextEditingController bodyStyleController;
  final TextEditingController trimController;
  final TextEditingController engineController;
  final TextEditingController engineSizeController;
  final TextEditingController exteriorColorController;
  final TextEditingController carFaxLinkController;
  final TextEditingController eTestController;
  final TextEditingController priceController;
  final TextEditingController specialPricelController;
  final TextEditingController msrpController;
  final TextEditingController paymentController;
  final TextEditingController warantyController;
  final TextEditingController dealerCommentController;
  final TextEditingController descriptionController;
  AddVehicleSucess({
    this.car,
    this.shouldShowMessage,
    this.videoPath,
    this.videoThumbnailPath,
    this.vinController,
    this.yearController,
    this.bodyStyleController,
    this.trimController,
    this.engineController,
    this.engineSizeController,
    this.exteriorColorController,
    this.carFaxLinkController,
    this.eTestController,
    this.priceController,
    this.specialPricelController,
    this.msrpController,
    this.paymentController,
    this.warantyController,
    this.dealerCommentController,
    this.descriptionController,
  });

  factory AddVehicleSucess.initial() => AddVehicleSucess(
        car: Car.empty(),
        shouldShowMessage: false,
        videoPath: '',
        videoThumbnailPath: '',
        vinController: TextEditingController(),
        yearController: TextEditingController(),
        bodyStyleController: TextEditingController(),
        trimController: TextEditingController(),
        engineController: TextEditingController(),
        engineSizeController: TextEditingController(),
        exteriorColorController: TextEditingController(),
        carFaxLinkController: TextEditingController(),
        eTestController: TextEditingController(),
        priceController: TextEditingController(),
        specialPricelController: TextEditingController(),
        msrpController: TextEditingController(),
        paymentController: TextEditingController(),
        warantyController: TextEditingController(),
        dealerCommentController: TextEditingController(),
        descriptionController: TextEditingController(),
      );

  AddVehicleSucess copyWith({
    Car car,
    bool shouldShowMessage,
    String videoPath,
    String videoThumbnailPath,
    TextEditingController vinController,
    TextEditingController yearController,
    TextEditingController makeController,
    TextEditingController modelController,
    TextEditingController transmissionController,
    TextEditingController fuelTypeController,
    TextEditingController conditionController,
    TextEditingController bodyStyleController,
    TextEditingController trimController,
    TextEditingController engineController,
    TextEditingController engineSizeController,
    TextEditingController exteriorColorController,
    TextEditingController carFaxLinkController,
    TextEditingController eTestController,
    TextEditingController priceController,
    TextEditingController specialPricelController,
    TextEditingController msrpController,
    TextEditingController paymentController,
    TextEditingController warantyController,
    TextEditingController dealerCommentController,
    TextEditingController descriptionController,
  }) {
    return AddVehicleSucess(
      car: car ?? this.car,
      shouldShowMessage: shouldShowMessage ?? this.shouldShowMessage,
      videoPath: videoPath ?? this.videoPath,
      videoThumbnailPath: videoThumbnailPath ?? this.videoThumbnailPath,
      vinController: vinController ?? this.vinController,
      yearController: yearController ?? this.yearController,
      bodyStyleController: bodyStyleController ?? this.bodyStyleController,
      trimController: trimController ?? this.trimController,
      engineController: engineController ?? this.engineController,
      engineSizeController: engineSizeController ?? this.engineSizeController,
      exteriorColorController:
          exteriorColorController ?? this.exteriorColorController,
      carFaxLinkController: carFaxLinkController ?? this.carFaxLinkController,
      eTestController: eTestController ?? this.eTestController,
      priceController: priceController ?? this.priceController,
      specialPricelController:
          specialPricelController ?? this.specialPricelController,
      msrpController: msrpController ?? this.msrpController,
      paymentController: paymentController ?? this.paymentController,
      warantyController: warantyController ?? this.warantyController,
      dealerCommentController:
          dealerCommentController ?? this.dealerCommentController,
      descriptionController:
          descriptionController ?? this.descriptionController,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'car': car.toMap(),
      'shouldShowMessage': shouldShowMessage,
      'videoPath': videoPath,
      'videoThumbnailPath': videoThumbnailPath,
    };
  }

  factory AddVehicleSucess.fromMap(Map<String, dynamic> map) {
    Car car = Car.fromMap(map['car']);
    return AddVehicleSucess(
      car: car,
      shouldShowMessage: map['shouldShowMessage'],
      videoPath: map['videoPath'],
      videoThumbnailPath: map['videoThumbnailPath'],
      vinController: TextEditingController(text: car.vin),
      yearController: TextEditingController(text: car.year),
      bodyStyleController: TextEditingController(text: car.bodyStyle),
      trimController: TextEditingController(text: car.trim),
      engineController: TextEditingController(text: car.transmission),
      engineSizeController: TextEditingController(text: car.engineSize),
      exteriorColorController: TextEditingController(text: car.exteriorColor),
      carFaxLinkController: TextEditingController(text: car.carFaxLink),
      eTestController: TextEditingController(text: car.eTest),
      priceController: TextEditingController(text: car.price),
      specialPricelController: TextEditingController(text: car.specialPricel),
      msrpController: TextEditingController(text: car.msrp),
      paymentController: TextEditingController(text: car.payment),
      warantyController: TextEditingController(text: car.waranty),
      dealerCommentController: TextEditingController(text: car.dealerComment),
      descriptionController: TextEditingController(text: car.description),
    );
  }

  @override
  String toString() {
    return 'AddVehicleSucess(car: $car, shouldShowMessage: $shouldShowMessage, videoPath: $videoPath, videoThumbnailPath: $videoThumbnailPath, vinController: $vinController, yearController: $yearController, bodyStyleController: $bodyStyleController, trimController: $trimController, engineController: $engineController, engineSizeController: $engineSizeController, exteriorColorController: $exteriorColorController, carFaxLinkController: $carFaxLinkController, eTestController: $eTestController, priceController: $priceController, specialPricelController: $specialPricelController, msrpController: $msrpController, paymentController: $paymentController, warantyController: $warantyController, dealerCommentController: $dealerCommentController, descriptionController: $descriptionController)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddVehicleSucess &&
        other.car == car &&
        other.shouldShowMessage == shouldShowMessage &&
        other.videoPath == videoPath &&
        other.videoThumbnailPath == videoThumbnailPath &&
        other.vinController == vinController &&
        other.yearController == yearController &&
        other.bodyStyleController == bodyStyleController &&
        other.trimController == trimController &&
        other.engineController == engineController &&
        other.engineSizeController == engineSizeController &&
        other.exteriorColorController == exteriorColorController &&
        other.carFaxLinkController == carFaxLinkController &&
        other.eTestController == eTestController &&
        other.priceController == priceController &&
        other.specialPricelController == specialPricelController &&
        other.msrpController == msrpController &&
        other.paymentController == paymentController &&
        other.warantyController == warantyController &&
        other.dealerCommentController == dealerCommentController &&
        other.descriptionController == descriptionController;
  }

  @override
  int get hashCode {
    return car.hashCode ^
        shouldShowMessage.hashCode ^
        videoPath.hashCode ^
        videoThumbnailPath.hashCode ^
        vinController.hashCode ^
        yearController.hashCode ^
        bodyStyleController.hashCode ^
        trimController.hashCode ^
        engineController.hashCode ^
        engineSizeController.hashCode ^
        exteriorColorController.hashCode ^
        carFaxLinkController.hashCode ^
        eTestController.hashCode ^
        priceController.hashCode ^
        specialPricelController.hashCode ^
        msrpController.hashCode ^
        paymentController.hashCode ^
        warantyController.hashCode ^
        dealerCommentController.hashCode ^
        descriptionController.hashCode;
  }
}
