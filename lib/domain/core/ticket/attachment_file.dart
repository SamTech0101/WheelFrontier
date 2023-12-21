import 'package:flutter/foundation.dart';

class AttachmentFile {
  final String id;
  final String cdnPath;
  final DateTime createdAt;
  AttachmentFile({
    @required this.id,
    @required this.cdnPath,
    @required this.createdAt,
  });

  AttachmentFile copyWith({
    String id,
    String cdnPath,
    DateTime createdAt,
  }) {
    return AttachmentFile(
      id: id ?? this.id,
      cdnPath: cdnPath ?? this.cdnPath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'attachFile': cdnPath,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory AttachmentFile.fromMap(Map<String, dynamic> map) {
    return AttachmentFile(
      id: map['id'].toString(),
      cdnPath: map['attachFile'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  @override
  String toString() =>
      'AttachmentFile(id: $id, cdnPath: $cdnPath, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AttachmentFile &&
        other.id == id &&
        other.cdnPath == cdnPath &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ cdnPath.hashCode ^ createdAt.hashCode;
}
