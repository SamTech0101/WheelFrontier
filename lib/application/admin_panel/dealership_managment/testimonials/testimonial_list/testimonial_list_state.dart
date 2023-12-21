part of 'testimonial_list_bloc.dart';

@immutable
abstract class TestimonialListState {}

class TestimonialListInitial extends TestimonialListState {}

class TestimonialListLoading extends TestimonialListState {}

class TestimonialListFailure extends TestimonialListState {}

class TestimonialListSuccess extends TestimonialListState {
  final List<Testimonial> testimonials;
  TestimonialListSuccess({@required this.testimonials});

  TestimonialListSuccess copyWith({
    List<Testimonial> testimonials,
  }) {
    return TestimonialListSuccess(
      testimonials: testimonials ?? this.testimonials,
    );
  }
}
