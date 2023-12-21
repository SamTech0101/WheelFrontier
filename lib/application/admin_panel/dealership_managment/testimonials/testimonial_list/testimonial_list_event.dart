part of 'testimonial_list_bloc.dart';

@immutable
abstract class TestimonialListEvent {}

class TestimonialListInitialized extends TestimonialListEvent {}

class TestimonialDeleted extends TestimonialListEvent {
  final String testimonialId;
  TestimonialDeleted({this.testimonialId});
}
