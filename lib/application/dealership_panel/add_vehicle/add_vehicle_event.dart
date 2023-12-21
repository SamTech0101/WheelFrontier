part of 'add_vehicle_bloc.dart';

@immutable
abstract class AddVehicleEvent {}

class VideoAdded extends AddVehicleEvent {
  final String videoPath;
  VideoAdded({this.videoPath});
}

class VideoDeleted extends AddVehicleEvent {
  final String videoPath;
  VideoDeleted({this.videoPath});
}

class VinIsChanged extends AddVehicleEvent {
  final String vinNumber;
  VinIsChanged({this.vinNumber});
}

class YearIsChanged extends AddVehicleEvent {
  final String year;
  YearIsChanged({this.year});
}

class MakeIsChanged extends AddVehicleEvent {
  final String make;
  MakeIsChanged({this.make});
}

class ModelIsChanged extends AddVehicleEvent {
  final String model;
  ModelIsChanged({this.model});
}

class TransmissionIsChanged extends AddVehicleEvent {
  final String transmission;
  TransmissionIsChanged({this.transmission});
}

class FuelTypeIsChanged extends AddVehicleEvent {
  final String fuel;
  FuelTypeIsChanged({this.fuel});
}

class ConditionIsChanged extends AddVehicleEvent {
  final String condition;
  ConditionIsChanged({this.condition});
}

class BodyStyleIsChanged extends AddVehicleEvent {
  final String bodyStyle;
  BodyStyleIsChanged({this.bodyStyle});
}

class TrimIsChanged extends AddVehicleEvent {
  final String trim;
  TrimIsChanged({this.trim});
}

class EngineModelIsChanged extends AddVehicleEvent {
  final String engine;
  EngineModelIsChanged({this.engine});
}

class EngineSizeIschanged extends AddVehicleEvent {
  final String engineSize;
  EngineSizeIschanged({this.engineSize});
}

class ExteriorColorIsChanged extends AddVehicleEvent {
  final String exteriorColor;
  ExteriorColorIsChanged({this.exteriorColor});
}

class CarfaxLinkIsChanged extends AddVehicleEvent {
  final String carfaxLnk;
  CarfaxLinkIsChanged({this.carfaxLnk});
}

class EtestIsChanged extends AddVehicleEvent {
  final String eTest;
  EtestIsChanged({this.eTest});
}

class PriceIsChanged extends AddVehicleEvent {
  final String price;
  PriceIsChanged({this.price});
}

class SpecialPriceIsChanged extends AddVehicleEvent {
  final String specialPrice;
  SpecialPriceIsChanged({this.specialPrice});
}

class MsrpIsChanged extends AddVehicleEvent {
  final String msrp;
  MsrpIsChanged({this.msrp});
}

class PaymentIsChanged extends AddVehicleEvent {
  final String payment;
  PaymentIsChanged({this.payment});
}

class WarrantyIsChanged extends AddVehicleEvent {
  final String warranty;
  WarrantyIsChanged({this.warranty});
}

class DealerCommentIsChanged extends AddVehicleEvent {
  final String dealerComment;
  DealerCommentIsChanged({this.dealerComment});
}

class DescriptionIsChanged extends AddVehicleEvent {
  final String description;
  DescriptionIsChanged({this.description});
}

class FrontMainImageIsChanged extends AddVehicleEvent {
  final File frontMainImages;
  FrontMainImageIsChanged({this.frontMainImages});
}

class FrontImageIsChanged extends AddVehicleEvent {
  final File frontImages;
  FrontImageIsChanged({this.frontImages});
}

class DriverSideImageIsChanged extends AddVehicleEvent {
  final File driverSidesImages;
  DriverSideImageIsChanged({this.driverSidesImages});
}

class PassengerSideImageIsChanged extends AddVehicleEvent {
  final File passengerSideImages;
  PassengerSideImageIsChanged({this.passengerSideImages});
}

class TireImageIsChanged extends AddVehicleEvent {
  final File tireImages;
  TireImageIsChanged({this.tireImages});
}

class InteriorDriverSideImageIsChanged extends AddVehicleEvent {
  final File interiorSideImages;
  InteriorDriverSideImageIsChanged({this.interiorSideImages});
}

class DashboardImagesIsChanged extends AddVehicleEvent {
  final File dashboardImages;
  DashboardImagesIsChanged({this.dashboardImages});
}

class ConsoleImagesIsChanged extends AddVehicleEvent {
  final File consoleImages;
  ConsoleImagesIsChanged({this.consoleImages});
}

class ImageOnTapped extends AddVehicleEvent {
  final File imagefile;
  ImageOnTapped({this.imagefile});
}

class FrontMianImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  FrontMianImageIsDeleted({this.imageFile});
}

class FrontImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  FrontImageIsDeleted({this.imageFile});
}

class DriverSideImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  DriverSideImageIsDeleted({this.imageFile});
}

class PassengerSideImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  PassengerSideImageIsDeleted({this.imageFile});
}

class TireImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  TireImageIsDeleted({this.imageFile});
}

class InteriorDriverSideImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  InteriorDriverSideImageIsDeleted({this.imageFile});
}

class DashboardImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  DashboardImageIsDeleted({this.imageFile});
}

class ConsoleImageIsDeleted extends AddVehicleEvent {
  final File imageFile;
  ConsoleImageIsDeleted({this.imageFile});
}

class ModelListTileIsTapped extends AddVehicleEvent {}

class SubmitButtomIsPeressed extends AddVehicleEvent {}
