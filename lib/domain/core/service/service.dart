import 'dart:convert';

class Service {
  final String type;
  final String description;
  final String number;
  final String minCount;
  final String termsDay;
  final String price;
  final bool isDefault;
  final String icon;
  Service({
    this.type,
    this.description,
    this.number,
    this.minCount,
    this.termsDay,
    this.price,
    this.isDefault,
    this.icon,
  });

  factory Service.empty() => Service(
        type: '',
        description: '',
        number: '',
        minCount: '',
        termsDay: '',
        price: '',
        isDefault: false,
        icon: '',
      );

  Service copyWith({
    String type,
    String description,
    String number,
    String minCount,
    String termsDay,
    String price,
    bool isDefault,
    String icon,
  }) {
    return Service(
      type: type ?? this.type,
      description: description ?? this.description,
      number: number ?? this.number,
      minCount: minCount ?? this.minCount,
      termsDay: termsDay ?? this.termsDay,
      price: price ?? this.price,
      isDefault: isDefault ?? this.isDefault,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'description': description,
      'number': number,
      'minCount': minCount,
      'termsDay': termsDay,
      'price': price,
      'isDefault': isDefault,
      'icon': icon,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      type: map['type'],
      description: map['description'],
      number: map['number'],
      minCount: map['minCount'],
      termsDay: map['termsDay'],
      price: map['price'],
      isDefault: map['isDefault'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Service(type: $type, description: $description, number: $number, minCount: $minCount, termsDay: $termsDay, price: $price, isDefault: $isDefault, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Service &&
        other.type == type &&
        other.description == description &&
        other.number == number &&
        other.minCount == minCount &&
        other.termsDay == termsDay &&
        other.price == price &&
        other.isDefault == isDefault &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        description.hashCode ^
        number.hashCode ^
        minCount.hashCode ^
        termsDay.hashCode ^
        price.hashCode ^
        isDefault.hashCode ^
        icon.hashCode;
  }
}
