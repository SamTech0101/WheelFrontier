part of 'add_testimonial_bloc.dart';

@immutable
abstract class AddTestimonialEvent {}

class AddTestimonialAddImageButtonPressed extends AddTestimonialEvent {}

class AddTestimonialCheckBoxChanged extends AddTestimonialEvent {
  final bool value;
  AddTestimonialCheckBoxChanged({@required this.value});
}

class AddTestimonialNameChanged extends AddTestimonialEvent {
  final String name;
  AddTestimonialNameChanged({
    @required this.name,
  });
}

class AddTestimonialCommentChanged extends AddTestimonialEvent {
  final String comment;
  AddTestimonialCommentChanged({
    @required this.comment,
  });
}

class AddTestimonialImageDeleted extends AddTestimonialEvent {
  final PickedFile platformFile;
  AddTestimonialImageDeleted({
    @required this.platformFile,
  });
}

class AddTestimonialSaveButtonPressed extends AddTestimonialEvent {}
