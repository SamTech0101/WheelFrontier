part of 'web_description_bloc.dart';

@immutable
abstract class WebDescriptionState {}

class WebDescriptionInitial extends WebDescriptionState {}

class WebDescriptionFailure extends WebDescriptionState {
  final Exception exception;
  WebDescriptionFailure({@required this.exception});
}

class WebDescriptionEditing extends WebDescriptionState {
  final TextEditingController comment;
  final TextEditingController whyChooseUs;
  final TextEditingController serviceDescription;
  final TextEditingController partDescription;
  final TextEditingController phonenumbers;
  final TextEditingController physicalAddress;
  final TextEditingController openDaysTime;
  final TextEditingController businessCaption;
  final TextEditingController facebook;
  final TextEditingController instagram;
  final TextEditingController twitter;
  final TextEditingController youtube;
  final TextEditingController valueYourTradeDescription;
  final TextEditingController carFinderDescription;
  final TextEditingController loanAppDescitpion;
  final PickedFile image;
  final PickedFile video;
  final String videoThumbnail;
  final bool waitingForApiResponse;
  final WebDescriptionResponse response;
  final ApiResponse apiResponse;
  WebDescriptionEditing({
    @required this.comment,
    @required this.whyChooseUs,
    @required this.serviceDescription,
    @required this.partDescription,
    @required this.phonenumbers,
    @required this.physicalAddress,
    @required this.openDaysTime,
    @required this.businessCaption,
    @required this.facebook,
    @required this.instagram,
    @required this.twitter,
    @required this.youtube,
    @required this.valueYourTradeDescription,
    @required this.carFinderDescription,
    @required this.loanAppDescitpion,
    @required this.waitingForApiResponse,
    @required this.apiResponse,
    this.image,
    this.video,
    this.videoThumbnail,
    this.response,
  });

  factory WebDescriptionEditing.initial() => WebDescriptionEditing(
        comment: TextEditingController(),
        whyChooseUs: TextEditingController(),
        serviceDescription: TextEditingController(),
        partDescription: TextEditingController(),
        phonenumbers: TextEditingController(),
        physicalAddress: TextEditingController(),
        openDaysTime: TextEditingController(),
        businessCaption: TextEditingController(),
        facebook: TextEditingController(),
        instagram: TextEditingController(),
        twitter: TextEditingController(),
        youtube: TextEditingController(),
        valueYourTradeDescription: TextEditingController(),
        carFinderDescription: TextEditingController(),
        loanAppDescitpion: TextEditingController(),
        waitingForApiResponse: false,
        image: PickedFile(''),
        video: PickedFile(''),
        videoThumbnail: '',
        response: null,
        apiResponse: ApiResponse(),
      );

  WebDescriptionEditing copyWith({
    TextEditingController comment,
    TextEditingController whyChooseUs,
    TextEditingController serviceDescription,
    TextEditingController partDescription,
    TextEditingController phonenumbers,
    TextEditingController physicalAddress,
    TextEditingController openDaysTime,
    TextEditingController businessCaption,
    TextEditingController facebook,
    TextEditingController instagram,
    TextEditingController twitter,
    TextEditingController youtube,
    TextEditingController valueYourTradeDescription,
    TextEditingController carFinderDescription,
    TextEditingController loanAppDescitpion,
    PickedFile image,
    PickedFile video,
    String videoThumbnail,
    bool waitingForApiResponse,
    WebDescriptionResponse response,
    ApiResponse apiResponse,
  }) {
    return WebDescriptionEditing(
      comment: comment ?? this.comment,
      whyChooseUs: whyChooseUs ?? this.whyChooseUs,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      partDescription: partDescription ?? this.partDescription,
      phonenumbers: phonenumbers ?? this.phonenumbers,
      physicalAddress: physicalAddress ?? this.physicalAddress,
      openDaysTime: openDaysTime ?? this.openDaysTime,
      businessCaption: businessCaption ?? this.businessCaption,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      youtube: youtube ?? this.youtube,
      valueYourTradeDescription:
          valueYourTradeDescription ?? this.valueYourTradeDescription,
      carFinderDescription: carFinderDescription ?? this.carFinderDescription,
      loanAppDescitpion: loanAppDescitpion ?? this.loanAppDescitpion,
      image: image ?? this.image,
      video: video ?? this.video,
      videoThumbnail: videoThumbnail ?? this.videoThumbnail,
      waitingForApiResponse:
          waitingForApiResponse ?? this.waitingForApiResponse,
      response: response ?? this.response,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  String toString() {
    return 'WebDescriptionEditing(comment: $comment, whyChooseUs: $whyChooseUs, serviceDescription: $serviceDescription, partDescription: $partDescription, phonenumbers: $phonenumbers, physicalAddress: $physicalAddress, openDaysTime: $openDaysTime, businessCaption: $businessCaption, facebook: $facebook, instagram: $instagram, twitter: $twitter, youtube: $youtube, valueYourTradeDescription: $valueYourTradeDescription, carFinderDescription: $carFinderDescription, loanAppDescitpion: $loanAppDescitpion, image: $image, video: $video, videoThumbnail: $videoThumbnail, waitingForApiResponse: $waitingForApiResponse, response: $response, apiResponse: $apiResponse)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WebDescriptionEditing &&
        other.comment == comment &&
        other.whyChooseUs == whyChooseUs &&
        other.serviceDescription == serviceDescription &&
        other.partDescription == partDescription &&
        other.phonenumbers == phonenumbers &&
        other.physicalAddress == physicalAddress &&
        other.openDaysTime == openDaysTime &&
        other.businessCaption == businessCaption &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.twitter == twitter &&
        other.youtube == youtube &&
        other.valueYourTradeDescription == valueYourTradeDescription &&
        other.carFinderDescription == carFinderDescription &&
        other.loanAppDescitpion == loanAppDescitpion &&
        other.image == image &&
        other.video == video &&
        other.videoThumbnail == videoThumbnail &&
        other.waitingForApiResponse == waitingForApiResponse &&
        other.response == response &&
        other.apiResponse == apiResponse;
  }

  @override
  int get hashCode {
    return comment.hashCode ^
        whyChooseUs.hashCode ^
        serviceDescription.hashCode ^
        partDescription.hashCode ^
        phonenumbers.hashCode ^
        physicalAddress.hashCode ^
        openDaysTime.hashCode ^
        businessCaption.hashCode ^
        facebook.hashCode ^
        instagram.hashCode ^
        twitter.hashCode ^
        youtube.hashCode ^
        valueYourTradeDescription.hashCode ^
        carFinderDescription.hashCode ^
        loanAppDescitpion.hashCode ^
        image.hashCode ^
        video.hashCode ^
        videoThumbnail.hashCode ^
        waitingForApiResponse.hashCode ^
        response.hashCode ^
        apiResponse.hashCode;
  }
}
