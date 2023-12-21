import 'package:flutter/foundation.dart';

class ServicePack {
  final String id;
  final String name;
  final String comment;
  ServicePack({
    this.id,
    @required this.name,
    @required this.comment,
  });

  ServicePack copyWith({
    String id,
    String name,
    String comment,
  }) {
    return ServicePack(
      id: id ?? this.id,
      name: name ?? this.name,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'requested_service': name,
      'comment': comment,
    };
  }

  factory ServicePack.fromMap(Map<String, dynamic> map) {
    return ServicePack(
      name: map['requested_service'],
      comment: map['comment'],
    );
  }

  @override
  String toString() => 'ServicePack(id: $id, name: $name, comment: $comment)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServicePack &&
        other.id == id &&
        other.name == name &&
        other.comment == comment;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ comment.hashCode;
}
