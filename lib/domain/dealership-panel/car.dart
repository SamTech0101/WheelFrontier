import 'dart:convert';
import 'dart:io';

import 'package:kt_dart/collection.dart';

class Car {
  final String vin;
  final String year;
  final String make;
  final String model;
  final String transmission;
  final String fuelType;
  final String condition;
  final String bodyStyle;
  final String trim;
  final String engine;
  final String engineSize;
  final String exteriorColor;
  final String carFaxLink;
  final String eTest;
  final String price;
  final String specialPricel;
  final String msrp;
  final String payment;
  final String waranty;
  final String dealerComment;
  final String description;
  final KtList<File> frontMainPhoto;
  final KtList<File> frontPhotos;
  final KtList<File> driverSidePhotos;
  final KtList<File> passengerSidePhotos;
  final KtList<File> tirePhotos;
  final KtList<File> interiorDriverSidePhotos;
  final KtList<File> dashboardPhotos;
  final KtList<File> consolePhotos;
  Car({
    this.vin,
    this.year,
    this.make,
    this.model,
    this.transmission,
    this.fuelType,
    this.condition,
    this.bodyStyle,
    this.trim,
    this.engine,
    this.engineSize,
    this.exteriorColor,
    this.carFaxLink,
    this.eTest,
    this.price,
    this.specialPricel,
    this.msrp,
    this.payment,
    this.waranty,
    this.dealerComment,
    this.description,
    this.frontMainPhoto,
    this.frontPhotos,
    this.driverSidePhotos,
    this.passengerSidePhotos,
    this.tirePhotos,
    this.interiorDriverSidePhotos,
    this.dashboardPhotos,
    this.consolePhotos,
  });

  factory Car.empty() => Car(
        vin: '',
        year: '',
        make: '',
        model: '',
        transmission: '',
        fuelType: '',
        condition: '',
        bodyStyle: '',
        trim: '',
        engine: '',
        engineSize: '',
        exteriorColor: '',
        carFaxLink: '',
        eTest: '',
        price: '',
        specialPricel: '',
        msrp: '',
        payment: '',
        waranty: '',
        dealerComment: '',
        description: '',
        frontMainPhoto: KtList.empty(),
        frontPhotos: KtList.empty(),
        driverSidePhotos: KtList.empty(),
        passengerSidePhotos: KtList.empty(),
        tirePhotos: KtList.empty(),
        interiorDriverSidePhotos: KtList.empty(),
        dashboardPhotos: KtList.empty(),
        consolePhotos: KtList.empty(),
      );

  Car copyWith({
    String vin,
    String year,
    String make,
    String model,
    String transmission,
    String fuelType,
    String condition,
    String bodyStyle,
    String trim,
    String engine,
    String engineSize,
    String exteriorColor,
    String carFaxLink,
    String eTest,
    String price,
    String specialPricel,
    String msrp,
    String payment,
    String waranty,
    String dealerComment,
    String description,
    KtList<File> frontMainPhoto,
    KtList<File> frontPhotos,
    KtList<File> driverSidePhotos,
    KtList<File> passengerSidePhotos,
    KtList<File> tirePhotos,
    KtList<File> interiorDriverSidePhotos,
    KtList<File> dashboardPhotos,
    KtList<File> consolePhotos,
  }) {
    return Car(
      vin: vin ?? this.vin,
      year: year ?? this.year,
      make: make ?? this.make,
      model: model ?? this.model,
      transmission: transmission ?? this.transmission,
      fuelType: fuelType ?? this.fuelType,
      condition: condition ?? this.condition,
      bodyStyle: bodyStyle ?? this.bodyStyle,
      trim: trim ?? this.trim,
      engine: engine ?? this.engine,
      engineSize: engineSize ?? this.engineSize,
      exteriorColor: exteriorColor ?? this.exteriorColor,
      carFaxLink: carFaxLink ?? this.carFaxLink,
      eTest: eTest ?? this.eTest,
      price: price ?? this.price,
      specialPricel: specialPricel ?? this.specialPricel,
      msrp: msrp ?? this.msrp,
      payment: payment ?? this.payment,
      waranty: waranty ?? this.waranty,
      dealerComment: dealerComment ?? this.dealerComment,
      description: description ?? this.description,
      frontMainPhoto: frontMainPhoto ?? this.frontMainPhoto,
      frontPhotos: frontPhotos ?? this.frontPhotos,
      driverSidePhotos: driverSidePhotos ?? this.driverSidePhotos,
      passengerSidePhotos: passengerSidePhotos ?? this.passengerSidePhotos,
      tirePhotos: tirePhotos ?? this.tirePhotos,
      interiorDriverSidePhotos:
          interiorDriverSidePhotos ?? this.interiorDriverSidePhotos,
      dashboardPhotos: dashboardPhotos ?? this.dashboardPhotos,
      consolePhotos: consolePhotos ?? this.consolePhotos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vin': vin,
      'year': year,
      'make': make,
      'model': model,
      'transmission': transmission,
      'fuelType': fuelType,
      'condition': condition,
      'bodyStyle': bodyStyle,
      'trim': trim,
      'engine': engine,
      'engineSize': engineSize,
      'exteriorColor': exteriorColor,
      'carFaxLink': carFaxLink,
      'eTest': eTest,
      'price': price,
      'specialPricel': specialPricel,
      'msrp': msrp,
      'payment': payment,
      'waranty': waranty,
      'dealerComment': dealerComment,
      'description': description,
      'frontMainPhoto': _mapFilesToFilePaths(frontMainPhoto),
      'frontPhotos': _mapFilesToFilePaths(frontPhotos),
      'driverSidePhotos': _mapFilesToFilePaths(driverSidePhotos),
      'passengerSidePhotos': _mapFilesToFilePaths(passengerSidePhotos),
      'tirePhotos': _mapFilesToFilePaths(tirePhotos),
      'interiorDriverSidePhotos':
          _mapFilesToFilePaths(interiorDriverSidePhotos),
      'dashboardPhotos': _mapFilesToFilePaths(dashboardPhotos),
      'consolePhotos': _mapFilesToFilePaths(consolePhotos),
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      vin: map['vin'],
      year: map['year'],
      make: map['make'],
      model: map['model'],
      transmission: map['transmission'],
      fuelType: map['fuelType'],
      condition: map['condition'],
      bodyStyle: map['bodyStyle'],
      trim: map['trim'],
      engine: map['engine'],
      engineSize: map['engineSize'],
      exteriorColor: map['exteriorColor'],
      carFaxLink: map['carFaxLink'],
      eTest: map['eTest'],
      price: map['price'],
      specialPricel: map['specialPricel'],
      msrp: map['msrp'],
      payment: map['payment'],
      waranty: map['waranty'],
      dealerComment: map['dealerComment'],
      description: map['description'],
      frontMainPhoto: _mapFilePathsToFiles((map['frontMainPhoto'])),
      frontPhotos: _mapFilePathsToFiles((map['frontPhotos'])),
      driverSidePhotos: _mapFilePathsToFiles((map['driverSidePhotos'])),
      passengerSidePhotos: _mapFilePathsToFiles((map['passengerSidePhotos'])),
      tirePhotos: _mapFilePathsToFiles((map['tirePhotos'])),
      interiorDriverSidePhotos:
          _mapFilePathsToFiles((map['interiorDriverSidePhotos'])),
      dashboardPhotos: _mapFilePathsToFiles((map['dashboardPhotos'])),
      consolePhotos: _mapFilePathsToFiles((map['consolePhotos'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Car(vin: $vin, year: $year, make: $make, model: $model, transmission: $transmission, fuelType: $fuelType, condition: $condition, bodyStyle: $bodyStyle, trim: $trim, engine: $engine, engineSize: $engineSize, exteriorColor: $exteriorColor, carFaxLink: $carFaxLink, eTest: $eTest, price: $price, specialPricel: $specialPricel, msrp: $msrp, payment: $payment, waranty: $waranty, dealerComment: $dealerComment, description: $description, frontMainPhoto: $frontMainPhoto, frontPhotos: $frontPhotos, driverSidePhotos: $driverSidePhotos, passengerSidePhotos: $passengerSidePhotos, tirePhotos: $tirePhotos, interiorDriverSidePhotos: $interiorDriverSidePhotos, dashboardPhotos: $dashboardPhotos, consolePhotos: $consolePhotos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car &&
        other.vin == vin &&
        other.year == year &&
        other.make == make &&
        other.model == model &&
        other.transmission == transmission &&
        other.fuelType == fuelType &&
        other.condition == condition &&
        other.bodyStyle == bodyStyle &&
        other.trim == trim &&
        other.engine == engine &&
        other.engineSize == engineSize &&
        other.exteriorColor == exteriorColor &&
        other.carFaxLink == carFaxLink &&
        other.eTest == eTest &&
        other.price == price &&
        other.specialPricel == specialPricel &&
        other.msrp == msrp &&
        other.payment == payment &&
        other.waranty == waranty &&
        other.dealerComment == dealerComment &&
        other.description == description &&
        other.frontMainPhoto == frontMainPhoto &&
        other.frontPhotos == frontPhotos &&
        other.driverSidePhotos == driverSidePhotos &&
        other.passengerSidePhotos == passengerSidePhotos &&
        other.tirePhotos == tirePhotos &&
        other.interiorDriverSidePhotos == interiorDriverSidePhotos &&
        other.dashboardPhotos == dashboardPhotos &&
        other.consolePhotos == consolePhotos;
  }

  @override
  int get hashCode {
    return vin.hashCode ^
        year.hashCode ^
        make.hashCode ^
        model.hashCode ^
        transmission.hashCode ^
        fuelType.hashCode ^
        condition.hashCode ^
        bodyStyle.hashCode ^
        trim.hashCode ^
        engine.hashCode ^
        engineSize.hashCode ^
        exteriorColor.hashCode ^
        carFaxLink.hashCode ^
        eTest.hashCode ^
        price.hashCode ^
        specialPricel.hashCode ^
        msrp.hashCode ^
        payment.hashCode ^
        waranty.hashCode ^
        dealerComment.hashCode ^
        description.hashCode ^
        frontMainPhoto.hashCode ^
        frontPhotos.hashCode ^
        driverSidePhotos.hashCode ^
        passengerSidePhotos.hashCode ^
        tirePhotos.hashCode ^
        interiorDriverSidePhotos.hashCode ^
        dashboardPhotos.hashCode ^
        consolePhotos.hashCode;
  }
}

List<String> _mapFilesToFilePaths(KtList<File> files) {
  KtList<String> ktFilePaths = files.map((file) => file.path);
  return ktFilePaths.asList();
}

KtList<File> _mapFilePathsToFiles(List<String> filePaths) {
  return filePaths.map((path) => File(path)).toImmutableList();
}
