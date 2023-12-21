import 'package:flutter/foundation.dart';

import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:abs_customer_sites/domain/core/util/util.dart';

class ContactUsDealership {
  final String message;
  final int id;
  final String status;
  final DateTime date;
  final User user;
  final String apiType;

  ContactUsDealership({
    @required this.message,
    @required this.id,
    @required this.status,
    @required this.date,
    @required this.user,
    @required this.apiType,
  });

  ContactUsDealership copyWith({
    String message,
    int id,
    String status,
    DateTime date,
    User user,
    String apiType,
  }) {
    return ContactUsDealership(
      message: message ?? this.message,
      id: id ?? this.id,
      status: status ?? this.status,
      date: date ?? this.date,
      user: user ?? this.user,
      apiType: apiType ?? this.apiType,
    );
  }

  factory ContactUsDealership.fromMap(Map<String, dynamic> map) {
    return ContactUsDealership(
      message: map['message'],
      id: map['id'],
      status: mapintToStatus(map['status']),
      date: DateTime.parse(map['createdAt']),
      user: User.fromMap(map['User']),
      apiType: map['apiType'],
    );
  }

  @override
  String toString() {
    return 'ContactUsDealership(message: $message, id: $id, status: $status, date: $date, user: $user , apiType : $apiType,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactUsDealership &&
        other.message == message &&
        other.id == id &&
        other.status == status &&
        other.date == date &&
        other.user == user&&
        other.apiType == apiType;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        id.hashCode ^
        status.hashCode ^
        date.hashCode ^
        user.hashCode^
        apiType.hashCode;
  }
}
