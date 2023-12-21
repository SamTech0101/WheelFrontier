part of 'web_description_bloc.dart';

@immutable
abstract class WebDescriptionEvent {}

class WebDescriptionPageInitialized extends WebDescriptionEvent {}

class WebDescriptionAddImagePressed extends WebDescriptionEvent {}

class WebDescriptionRemoveImagePressed extends WebDescriptionEvent {}

class WebDescriptionAddVideoPressed extends WebDescriptionEvent {}

class WebDescriptionRemoveVideoPressed extends WebDescriptionEvent {}

class WebDescriptionSavedButtonPressed extends WebDescriptionEvent {}
