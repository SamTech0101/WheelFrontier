import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial.dart';
import 'package:abs_customer_sites/domain/admin-panel/testimonial/testimonial_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_testimonial_event.dart';
part 'add_testimonial_state.dart';

class AddTestimonialBloc
    extends Bloc<AddTestimonialEvent, AddTestimonialState> {
  final Testimonial testimonial;
  final Dealership dealership;
  final TestimonialRepository testimonialRepository;
  AddTestimonialBloc({
    @required this.testimonialRepository,
    @required this.testimonial,
    @required this.dealership,
  }) : super(AddTestimonialEditing.initial(testimonial));

  @override
  Stream<AddTestimonialState> mapEventToState(
    AddTestimonialEvent event,
  ) async* {
    final currentState = state as AddTestimonialEditing;
    if (event is AddTestimonialAddImageButtonPressed) {
      ImagePicker imagePicker = ImagePicker();
      PickedFile image =
          await imagePicker.getImage(source: ImageSource.gallery);
      yield currentState.copyWith(image: image, apiResponse: ApiResponse());
    } else if (event is AddTestimonialNameChanged) {
      yield currentState.copyWith(name: event.name, apiResponse: ApiResponse());
    } else if (event is AddTestimonialCommentChanged) {
      yield currentState.copyWith(
          comment: event.comment, apiResponse: ApiResponse());
    } else if (event is AddTestimonialImageDeleted) {
      yield currentState.copyWith(
        image: null,
        apiResponse: ApiResponse(),
      );
    } else if (event is AddTestimonialCheckBoxChanged) {
      yield currentState.copyWith(
        showAtHomePage: event.value,
        apiResponse: ApiResponse(),
      );
    } else if (event is AddTestimonialSaveButtonPressed) {
      // if initial testimonial is null it means admin is creating a new testimonial
      // so we will call the create method and otherwise the update method

      try {
        yield currentState.copyWith(waitingForApiResponse: true);
        if (testimonial == null) {
          await testimonialRepository.create(
            dealership.id.toString(),
            File(currentState.image.path),
            currentState.name,
            currentState.comment,
            currentState.showAtHomePage,
          );
        } else {
          await testimonialRepository.update(
            testimonial.id.toString(),
            currentState.image != null ? File(currentState.image.path) : null,
            currentState.name,
            currentState.comment,
            currentState.showAtHomePage,
          );
        }
        yield currentState.copyWith(
            apiResponse: ApiResponse(response: Success));
      } catch (e) {
        yield currentState.copyWith(apiResponse: ApiResponse(response: e));
      }
    }
  }
}
