import 'package:flutter/material.dart';

class Testimonial {
  final String id;
  final String name;
  final String image;
  final String comment;
  final bool showAtHomePage;
  Testimonial({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.comment,
    @required this.showAtHomePage,
  });

  Testimonial copyWith({
    String id,
    String name,
    String image,
    String comment,
    bool showAtHomePage,
  }) {
    return Testimonial(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      comment: comment ?? this.comment,
      showAtHomePage: showAtHomePage ?? this.showAtHomePage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photo': image,
      'comment': comment,
      'show_at_HomePage': showAtHomePage,
    };
  }

  factory Testimonial.fromMap(Map<String, dynamic> map) {
    return Testimonial(
      id: map['id'].toString(),
      name: map['name'],
      image: map['photo'],
      comment: map['comment'],
      showAtHomePage: map['show_at_HomePage'] == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return 'Testimonial(id: $id, name: $name, image: $image, comment: $comment, showAtHomePage: $showAtHomePage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Testimonial &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.comment == comment &&
        other.showAtHomePage == showAtHomePage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        comment.hashCode ^
        showAtHomePage.hashCode;
  }
}
