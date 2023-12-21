part of 'add_service_from_bloc.dart';

@immutable
abstract class AddServiceFromEvent {}

class AddServiceTypeChanged extends AddServiceFromEvent {
  final String type;
  AddServiceTypeChanged({
    @required this.type,
  });
}

class AddServiceDescriptionChanged extends AddServiceFromEvent {
  final String description;
  AddServiceDescriptionChanged({
    @required this.description,
  });
}

class AddServiceNumberChanged extends AddServiceFromEvent {
  final String number;
  AddServiceNumberChanged({
    @required this.number,
  });
}

class AddServiceMinCountChanged extends AddServiceFromEvent {
  final String minCount;
  AddServiceMinCountChanged({
    @required this.minCount,
  });
}

class AddServiceTermDayChanged extends AddServiceFromEvent {
  final String termDay;
  AddServiceTermDayChanged({
    @required this.termDay,
  });
}

class AddServiceIsDefaultChanged extends AddServiceFromEvent {
  final bool isDefault;
  AddServiceIsDefaultChanged({
    @required this.isDefault,
  });
}
