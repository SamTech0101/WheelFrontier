import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class VehiclePart {
  final String id;
  final String partName;
  final String comment;
  VehiclePart({
    @required this.id,
    @required this.partName,
    @required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'part_name': partName,
      'comment': comment,
    };
  }

  factory VehiclePart.fromMap(Map<String, dynamic> map) {
    return VehiclePart(
      id: Uuid().v1(),
      partName: map['part_name'],
      comment: map['comment'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VehiclePart &&
        other.id == id &&
        other.partName == partName &&
        other.comment == comment;
  }

  @override
  String toString() =>
      'VehiclePart(id: $id, partName: $partName, comment: $comment)';

  @override
  int get hashCode => id.hashCode ^ partName.hashCode ^ comment.hashCode;

  VehiclePart copyWith({
    String id,
    String partName,
    String comment,
  }) {
    return VehiclePart(
      id: id ?? this.id,
      partName: partName ?? this.partName,
      comment: comment ?? this.comment,
    );
  }
}
