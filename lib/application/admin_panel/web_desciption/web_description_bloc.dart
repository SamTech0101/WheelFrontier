import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_request.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'web_description_event.dart';
part 'web_description_state.dart';

class WebDescriptionBloc
    extends Bloc<WebDescriptionEvent, WebDescriptionState> {
  final Dealership dealership;
  final WebDescriptionRepository webDescriptionRepository;
  WebDescriptionBloc({
    @required this.dealership,
    @required this.webDescriptionRepository,
  }) : super(WebDescriptionInitial());

  @override
  Stream<WebDescriptionState> mapEventToState(
    WebDescriptionEvent event,
  ) async* {
    if (event is WebDescriptionPageInitialized) {
      try {
        WebDescriptionResponse response =
            await webDescriptionRepository.read(dealership.id.toString());
        yield WebDescriptionEditing(
          comment: TextEditingController(text: response.comment),
          whyChooseUs: TextEditingController(text: response.whyChooseUs),
          serviceDescription: TextEditingController(text: response.serviceDesc),
          partDescription: TextEditingController(text: response.partDesc),
          phonenumbers: TextEditingController(text: response.phoneNumbers),
          physicalAddress:
              TextEditingController(text: response.physicalAddress),
          openDaysTime: TextEditingController(text: response.openDaysTime),
          businessCaption:
              TextEditingController(text: response.businessCaption),
          facebook: TextEditingController(text: response.facebook),
          instagram: TextEditingController(text: response.instagram),
          twitter: TextEditingController(text: response.twitter),
          youtube: TextEditingController(text: response.youtube),
          valueYourTradeDescription:
              TextEditingController(text: response.valueYourTradeDesc),
          carFinderDescription:
              TextEditingController(text: response.carFinderDesc),
          loanAppDescitpion: TextEditingController(text: response.loanAppDesc),
          waitingForApiResponse: false,

          // making picked file an empty file for being able to use copyWith method
          image: PickedFile(''),
          video: PickedFile(''),
          videoThumbnail: '',
          response: response,
          apiResponse: ApiResponse(),
        );
      } catch (e) {
        if (e is NoWebDescrpitionFound) {
          yield WebDescriptionEditing.initial();
        } else {
          yield WebDescriptionFailure(exception: e);
        }
      }
    } else if (event is WebDescriptionAddImagePressed) {
      final currentState = state as WebDescriptionEditing;
      if (currentState.image.path == '') {
        ImagePicker imagePicker = ImagePicker();
        PickedFile image =
            await imagePicker.getImage(source: ImageSource.gallery);
        if (image != null) {
          yield currentState.copyWith(
            image: image,
            apiResponse: ApiResponse(),
          );
        }
      }
    } else if (event is WebDescriptionRemoveImagePressed) {
      final currentState = state as WebDescriptionEditing;
      if (currentState.image.path != '') {
        yield currentState.copyWith(
          image: PickedFile(''),
          apiResponse: ApiResponse(),
        );
      } else {
        final updatedResponse = currentState.response.copyWith(logo: '');
        yield currentState.copyWith(
          response: updatedResponse,
          apiResponse: ApiResponse(),
        );
      }
    } else if (event is WebDescriptionAddVideoPressed) {
      final currentState = state as WebDescriptionEditing;
      if (currentState.video.path == '') {
        ImagePicker imagePicker = ImagePicker();
        PickedFile video =
            await imagePicker.getVideo(source: ImageSource.gallery);
        if (video != null) {
          String thumbnailPath = await VideoThumbnail.thumbnailFile(
            video: video.path,
            thumbnailPath: (await getApplicationDocumentsDirectory()).path,
            imageFormat: ImageFormat.JPEG,
            quality: 75,
          );
          yield currentState.copyWith(
            video: video,
            videoThumbnail: thumbnailPath,
            apiResponse: ApiResponse(),
          );
        }
      }
    } else if (event is WebDescriptionRemoveVideoPressed) {
      final currentState = state as WebDescriptionEditing;
      if (currentState.video.path != '') {
        yield currentState.copyWith(
          video: PickedFile(''),
          videoThumbnail: '',
          apiResponse: ApiResponse(),
        );
      } else {
        final updatedResposne =
            currentState.response.copyWith(speechVideoScreenshot: '');
        yield currentState.copyWith(
          response: updatedResposne,
          apiResponse: ApiResponse(),
        );
      }
    } else if (event is WebDescriptionSavedButtonPressed) {
      final currentState = state as WebDescriptionEditing;
      yield currentState.copyWith(waitingForApiResponse: true);
      WebDescriptionRequest request = WebDescriptionRequest(
        dealershipId: dealership.id.toString(),
        comment: currentState.comment.text,
        whyChooseUs: currentState.whyChooseUs.text,
        serviceDescription: currentState.serviceDescription.text,
        partDescription: currentState.partDescription.text,
        phonenumbers: currentState.phonenumbers.text,
        physicalAddress: currentState.physicalAddress.text,
        openDaysTime: currentState.openDaysTime.text,
        businessCaption: currentState.businessCaption.text,
        facebook: currentState.facebook.text,
        instagram: currentState.instagram.text,
        twitter: currentState.twitter.text,
        youtube: currentState.youtube.text,
        valueYourTradeDescription: currentState.valueYourTradeDescription.text,
        carFinderDescription: currentState.carFinderDescription.text,
        loanAppDescitpion: currentState.loanAppDescitpion.text,
        image: currentState.image,
        video: currentState.video,
      );
      if (currentState.response == null) {
        request = request.copyWith(
          image: currentState.image,
          video: currentState.video,
        );
      } else {
        if (currentState.image.path != '') {
          request = request.copyWith(image: currentState.image);
        }
        if (currentState.video.path != '') {
          request = request.copyWith(video: currentState.video);
        }
      }
      try {
        if (currentState.response == null) {
          await webDescriptionRepository.create(request);
        } else {
          await webDescriptionRepository.update(
            currentState.response.id.toString(),
            request,
          );
        }
        yield currentState.copyWith(
          waitingForApiResponse: false,
          apiResponse: ApiResponse(response: Success()),
        );
      } catch (e) {
        yield currentState.copyWith(
          waitingForApiResponse: false,
          apiResponse: ApiResponse(response: e),
        );
      }
    }
  }
}
