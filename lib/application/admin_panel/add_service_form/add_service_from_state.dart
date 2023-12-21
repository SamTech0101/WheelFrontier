part of 'add_service_from_bloc.dart';

@immutable
abstract class AddServiceFromState {}

class AddServiceState extends AddServiceFromState {
  final Service service;
  final TextEditingController typeController;
  final TextEditingController descriptionController;
  final TextEditingController numberController;
  final TextEditingController minCountController;
  final TextEditingController termsDayController;
  final TextEditingController priceController;

  AddServiceState({
    @required this.service,
    @required this.typeController,
    @required this.descriptionController,
    @required this.numberController,
    @required this.minCountController,
    @required this.termsDayController,
    @required this.priceController,
  });

  factory AddServiceState.initial() => AddServiceState(
        service: Service.empty(),
        typeController: TextEditingController(),
        descriptionController: TextEditingController(),
        numberController: TextEditingController(),
        minCountController: TextEditingController(),
        termsDayController: TextEditingController(),
        priceController: TextEditingController(),
      );

  AddServiceState copyWith({
    Service service,
    TextEditingController typeController,
    TextEditingController descriptionController,
    TextEditingController numberController,
    TextEditingController minCountController,
    TextEditingController termsDayController,
    TextEditingController priceController,
  }) {
    return AddServiceState(
      service: service ?? this.service,
      typeController: typeController ?? this.typeController,
      descriptionController:
          descriptionController ?? this.descriptionController,
      numberController: numberController ?? this.numberController,
      minCountController: minCountController ?? this.minCountController,
      termsDayController: termsDayController ?? this.termsDayController,
      priceController: priceController ?? this.priceController,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'service': service.toMap(),
    };
  }

  factory AddServiceState.fromMap(Map<String, dynamic> map) {
    Service service = Service.fromMap(map['service']);
    return AddServiceState(
      service: service,
      typeController: TextEditingController(text: service.type),
      descriptionController: TextEditingController(text: service.description),
      numberController: TextEditingController(text: service.number),
      minCountController: TextEditingController(text: service.minCount),
      termsDayController: TextEditingController(text: service.termsDay),
      priceController: TextEditingController(text: service.price),
    );
  }

  @override
  String toString() {
    return 'AddServiceState(service: $service, typeController: $typeController, descriptionController: $descriptionController, numberController: $numberController, minCountController: $minCountController, termsDayController: $termsDayController, priceController: $priceController)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddServiceState &&
        other.service == service &&
        other.typeController == typeController &&
        other.descriptionController == descriptionController &&
        other.numberController == numberController &&
        other.minCountController == minCountController &&
        other.termsDayController == termsDayController &&
        other.priceController == priceController;
  }

  @override
  int get hashCode {
    return service.hashCode ^
        typeController.hashCode ^
        descriptionController.hashCode ^
        numberController.hashCode ^
        minCountController.hashCode ^
        termsDayController.hashCode ^
        priceController.hashCode;
  }
}
