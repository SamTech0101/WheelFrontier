import 'package:flutter/foundation.dart';

class TestDrive {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String message;
  final String methodOfContact;
  final String salutation;
  final DateTime requestedDate;
  TestDrive({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phone,
    @required this.message,
    @required this.methodOfContact,
    @required this.salutation,
    @required this.requestedDate,
  });

  TestDrive copyWith({
    String firstName,
    String lastName,
    String email,
    String phone,
    String message,
    String methodOfContact,
    String salutation,
    DateTime requestedDate,
  }) {
    return TestDrive(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      message: message ?? this.message,
      methodOfContact: methodOfContact ?? this.methodOfContact,
      salutation: salutation ?? this.salutation,
      requestedDate: requestedDate ?? this.requestedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'f_name': firstName,
      'l_name': lastName,
      'email': email,
      'mobile': phone,
      'comment': message,
      'method_of_contact': methodOfContact,
      'user_salutation': mapUserSalutationToInt(salutation),
      'requested_date': requestedDate.toIso8601String(),
    };
  }

  factory TestDrive.fromMap(Map<String, dynamic> map) {
    return TestDrive(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      message: map['message'],
      methodOfContact: map['methodOfContact'],
      salutation: map['salutation'],
      requestedDate: DateTime.fromMillisecondsSinceEpoch(map['requestedDate']),
    );
  }

  @override
  String toString() {
    return 'TestDrive(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, message: $message, methodOfContact: $methodOfContact, salutation: $salutation, requestedDate: $requestedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestDrive &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone &&
        other.message == message &&
        other.methodOfContact == methodOfContact &&
        other.salutation == salutation &&
        other.requestedDate == requestedDate;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        message.hashCode ^
        methodOfContact.hashCode ^
        salutation.hashCode ^
        requestedDate.hashCode;
  }
}

int mapUserSalutationToInt(String userSalutation) {
  switch (userSalutation) {
    case 'Miss':
      return 1;
    case 'Ms':
      return 2;
    case 'Mrs':
      return 3;
    case 'Mr':
      return 4;
    case 'Dr':
      return 5;
    case 'Other':
      return 6;
    default:
      return 6;
  }
}
