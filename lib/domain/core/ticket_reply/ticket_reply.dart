import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abs_customer_sites/domain/core/ticket/attachment_file.dart';

class TicketReply {
  final String text;
  final String name;
  final String number;
  final DateTime createdAt;
  final List<AttachmentFile> attachments;
  TicketReply({
    this.text,
    this.name,
    this.number,
    this.createdAt,
    this.attachments,
  });

  TicketReply copyWith({
    String text,
    String name,
    String number,
    DateTime createdAt,
    List<AttachmentFile> attachments,
  }) {
    return TicketReply(
      text: text ?? this.text,
      name: name ?? this.name,
      number: number ?? this.number,
      createdAt: createdAt ?? this.createdAt,
      attachments: attachments ?? this.attachments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'name': name,
      'number': number,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'attaches': attachments?.map((x) => x.toMap())?.toList(),
    };
  }

  factory TicketReply.fromMap(Map<String, dynamic> map) {
    return TicketReply(
      text: map['text'],
      name: map['name'],
      number: map['number'],
      createdAt: DateTime.parse(map['createdAt']),
      attachments: List<AttachmentFile>.from(
          map['attaches']?.map((x) => AttachmentFile.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketReply.fromJson(String source) =>
      TicketReply.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketReply(text: $text, name: $name, number: $number, createdAt: $createdAt, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketReply &&
        other.text == text &&
        other.name == name &&
        other.number == number &&
        other.createdAt == createdAt &&
        listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return text.hashCode ^
        name.hashCode ^
        number.hashCode ^
        createdAt.hashCode ^
        attachments.hashCode;
  }
}
