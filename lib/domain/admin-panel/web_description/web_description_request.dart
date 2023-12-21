import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WebDescriptionRequest {
  final String dealershipId;
  final String comment;
  final String whyChooseUs;
  final String serviceDescription;
  final String partDescription;
  final String phonenumbers;
  final String physicalAddress;
  final String openDaysTime;
  final String businessCaption;
  final String facebook;
  final String instagram;
  final String twitter;
  final String youtube;
  final String valueYourTradeDescription;
  final String carFinderDescription;
  final String loanAppDescitpion;
  final PickedFile image;
  final PickedFile video;
  WebDescriptionRequest({
    @required this.dealershipId,
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
    this.image,
    this.video,
  });

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'why_choose_us': whyChooseUs,
      'service_desc': serviceDescription,
      'part_desc': partDescription,
      'phone_numbers': phonenumbers,
      'physical_address': physicalAddress,
      'open_days_time': openDaysTime,
      'business_caption': businessCaption,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'youtube': youtube,
      'value_your_trade_desc': valueYourTradeDescription,
      'car_finder_desc': carFinderDescription,
      'loan_app_desc': loanAppDescitpion,
      'frk_dealership_id': dealershipId,
    };
  }

  WebDescriptionRequest copyWith({
    String dealershipId,
    String comment,
    String whyChooseUs,
    String serviceDescription,
    String partDescription,
    String phonenumbers,
    String physicalAddress,
    String openDaysTime,
    String businessCaption,
    String facebook,
    String instagram,
    String twitter,
    String youtube,
    String valueYourTradeDescription,
    String carFinderDescription,
    String loanAppDescitpion,
    PickedFile image,
    PickedFile video,
  }) {
    return WebDescriptionRequest(
      dealershipId: dealershipId ?? this.dealershipId,
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
    );
  }
}
