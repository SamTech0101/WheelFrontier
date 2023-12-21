import 'dart:convert';

import 'package:abs_customer_sites/domain/admin-panel/request.dart';

class ContactUsAdmin extends Request {
  final String name;
  final int phoneNumber;
  final String email;
  final String message;
  final DateTime date;
  final String status;
  final String requestType;
  ContactUsAdmin({
    this.name,
    this.phoneNumber,
    this.email,
    this.message,
    this.date,
    this.status,
    this.requestType = Contact_Us_Request,
  });

  ContactUsAdmin copyWith({
    String name,
    int phoneNumber,
    String email,
    String message,
    DateTime date,
    String status,
  }) {
    return ContactUsAdmin(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      message: message ?? this.message,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'message': message,
      'date': date.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory ContactUsAdmin.fromMap(Map<String, dynamic> map) {
    return ContactUsAdmin(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      message: map['message'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUsAdmin.fromJson(String source) =>
      ContactUsAdmin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactUs(name: $name, phoneNumber: $phoneNumber, email: $email, message: $message, date: $date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactUsAdmin &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.message == message &&
        other.date == date &&
        other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        message.hashCode ^
        date.hashCode ^
        status.hashCode;
  }
}
