import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial_repository.dart';
import 'package:meta/meta.dart';

part 'testimonial_list_event.dart';
part 'testimonial_list_state.dart';

// fetching all the created testimonials to show

class TestimonialListBloc
    extends Bloc<TestimonialListEvent, TestimonialListState> {
  final Dealership dealership;
  final TestimonialRepository testimonialRepository;
  TestimonialListBloc({
    @required this.dealership,
    @required this.testimonialRepository,
  }) : super(TestimonialListInitial());

  @override
  Stream<TestimonialListState> mapEventToState(
    TestimonialListEvent event,
  ) async* {
    if (event is TestimonialListInitialized) {
      yield TestimonialListLoading();
      List<Testimonial> testimonials = await testimonialRepository.readAll(
        dealership.id.toString(),
      );
      yield TestimonialListSuccess(testimonials: testimonials);
    }
    if (event is TestimonialDeleted) {
      yield TestimonialListLoading();
      // adding this event to refresh the page after a testimonial get deleted
      add(TestimonialListInitialized());
      await testimonialRepository.delete(event.testimonialId);
    }
  }
}
