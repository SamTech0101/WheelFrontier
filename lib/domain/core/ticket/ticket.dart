import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/domain/core/ticket/attachment_file.dart';

class Ticket {
  final String id;
  final String title;
  final String text;
  final String name;
  final String unit;
  final String number;
  final String status;
  final DateTime createdAt;
  final List<AttachmentFile> attachments;
  Ticket({
    this.id,
    this.title,
    this.text,
    this.name,
    this.unit,
    this.number,
    this.status,
    this.createdAt,
    this.attachments,
  });

  Ticket copyWith({
    String id,
    String title,
    String text,
    String name,
    String unit,
    String number,
    String status,
    DateTime createdAt,
    List<AttachmentFile> attachments,
  }) {
    return Ticket(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      number: number ?? this.number,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      attachments: attachments ?? this.attachments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'name': name,
      'unit': unit,
      'number': number,
      'status': status,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'attaches': attachments?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'].toString(),
      title: map['title'],
      text: map['text'],
      name: map['name'],
      unit: map['unit'].toString(),
      number: map['number'].toString(),
      status: map['status'].toString(),
      createdAt: DateTime.parse(map['createdAt']).toLocal(),
      attachments: List<AttachmentFile>.from(
          map['attaches']?.map((x) => AttachmentFile.fromMap(x))),
    );
  }

  @override
  String toString() {
    return 'Ticket(id: $id, title: $title, text: $text, name: $name, unit: $unit, number: $number, status: $status, createdAt: $createdAt, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ticket &&
        other.id == id &&
        other.title == title &&
        other.text == text &&
        other.name == name &&
        other.unit == unit &&
        other.number == number &&
        other.status == status &&
        other.createdAt == createdAt &&
        listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        text.hashCode ^
        name.hashCode ^
        unit.hashCode ^
        number.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        attachments.hashCode;
  }
}
