import 'dart:convert';

import 'package:abs_customer_sites/domain/admin-panel/request.dart';

class DemoRequest extends Request {
  final String firstName;
  final String lastName;
  final String companyName;
  final String email;
  final int phoneNumber;
  final String dealershipAddress;
  final int contactMethod;
  final String comment;
  final DateTime date;
  final String status;
  final String requestType;
  DemoRequest({
    this.firstName,
    this.lastName,
    this.companyName,
    this.email,
    this.phoneNumber,
    this.dealershipAddress,
    this.contactMethod,
    this.comment,
    this.date,
    this.status,
    this.requestType = Demo_Request,
  });

  DemoRequest copyWith({
    String firstName,
    String lastName,
    String companyName,
    String email,
    int phoneNumber,
    String dealershipAddress,
    int contactMethod,
    String comment,
    DateTime date,
    String status,
  }) {
    return DemoRequest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dealershipAddress: dealershipAddress ?? this.dealershipAddress,
      contactMethod: contactMethod ?? this.contactMethod,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'companyName': companyName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dealershipAddress': dealershipAddress,
      'contactMethod': contactMethod,
      'comment': comment,
      'date': date.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory DemoRequest.fromMap(Map<String, dynamic> map) {
    return DemoRequest(
      firstName: map['firstName'],
      lastName: map['lastName'],
      companyName: map['companyName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      dealershipAddress: map['dealershipAddress'],
      contactMethod: map['contactMethod'],
      comment: map['comment'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DemoRequest.fromJson(String source) =>
      DemoRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DemoRequest(firstName: $firstName, lastName: $lastName, companyName: $companyName, email: $email, phoneNumber: $phoneNumber, dealershipAddress: $dealershipAddress, contactMethod: $contactMethod, comment: $comment, date: $date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DemoRequest &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.companyName == companyName &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.dealershipAddress == dealershipAddress &&
        other.contactMethod == contactMethod &&
        other.comment == comment &&
        other.date == date &&
        other.status == status;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        companyName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        dealershipAddress.hashCode ^
        contactMethod.hashCode ^
        comment.hashCode ^
        date.hashCode ^
        status.hashCode;
  }
}
