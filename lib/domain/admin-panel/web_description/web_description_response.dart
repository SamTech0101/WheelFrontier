class WebDescriptionResponse {
  int id;
  String comment;
  String speechVideo;
  String speechVideoScreenshot;
  String whyChooseUs;
  String serviceDesc;
  String partDesc;
  String phoneNumbers;
  String physicalAddress;
  String openDaysTime;
  String logo;
  String businessCaption;
  String facebook;
  String instagram;
  String twitter;
  String youtube;
  String valueYourTradeDesc;
  String carFinderDesc;
  String loanAppDesc;
  String createdAt;
  String updatedAt;
  int frkDealershipId;

  WebDescriptionResponse({
    this.id,
    this.comment,
    this.speechVideo,
    this.speechVideoScreenshot,
    this.whyChooseUs,
    this.serviceDesc,
    this.partDesc,
    this.phoneNumbers,
    this.physicalAddress,
    this.openDaysTime,
    this.logo,
    this.businessCaption,
    this.facebook,
    this.instagram,
    this.twitter,
    this.youtube,
    this.valueYourTradeDesc,
    this.carFinderDesc,
    this.loanAppDesc,
    this.createdAt,
    this.updatedAt,
    this.frkDealershipId,
  });

  WebDescriptionResponse.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    speechVideo = json['speech_video'] ?? '';
    speechVideoScreenshot = json['speech_video_screenshot'];
    whyChooseUs = json['why_choose_us'];
    serviceDesc = json['service_desc'];
    partDesc = json['part_desc'];
    phoneNumbers = json['phone_numbers'];
    physicalAddress = json['physical_address'];
    openDaysTime = json['open_days_time'];
    logo = json['logo'] ?? '';
    businessCaption = json['business_caption'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    youtube = json['youtube'];
    valueYourTradeDesc = json['value_your_trade_desc'];
    carFinderDesc = json['car_finder_desc'];
    loanAppDesc = json['loan_app_desc'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    frkDealershipId = json['frk_dealership_id'];
  }

  @override
  String toString() {
    return 'WebDescriptionResponse(id: $id, comment: $comment, speechVideo: $speechVideo, speechVideoScreenshot: $speechVideoScreenshot, whyChooseUs: $whyChooseUs, serviceDesc: $serviceDesc, partDesc: $partDesc, phoneNumbers: $phoneNumbers, physicalAddress: $physicalAddress, openDaysTime: $openDaysTime, logo: $logo, businessCaption: $businessCaption, facebook: $facebook, instagram: $instagram, twitter: $twitter, youtube: $youtube, valueYourTradeDesc: $valueYourTradeDesc, carFinderDesc: $carFinderDesc, loanAppDesc: $loanAppDesc, createdAt: $createdAt, updatedAt: $updatedAt, frkDealershipId: $frkDealershipId)';
  }

  WebDescriptionResponse copyWith({
    int id,
    String comment,
    String speechVideo,
    String speechVideoScreenshot,
    String whyChooseUs,
    String serviceDesc,
    String partDesc,
    String phoneNumbers,
    String physicalAddress,
    String openDaysTime,
    String logo,
    String businessCaption,
    String facebook,
    String instagram,
    String twitter,
    String youtube,
    String valueYourTradeDesc,
    String carFinderDesc,
    String loanAppDesc,
    String createdAt,
    String updatedAt,
    int frkDealershipId,
  }) {
    return WebDescriptionResponse(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      speechVideo: speechVideo ?? this.speechVideo,
      speechVideoScreenshot:
          speechVideoScreenshot ?? this.speechVideoScreenshot,
      whyChooseUs: whyChooseUs ?? this.whyChooseUs,
      serviceDesc: serviceDesc ?? this.serviceDesc,
      partDesc: partDesc ?? this.partDesc,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      physicalAddress: physicalAddress ?? this.physicalAddress,
      openDaysTime: openDaysTime ?? this.openDaysTime,
      logo: logo ?? this.logo,
      businessCaption: businessCaption ?? this.businessCaption,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      youtube: youtube ?? this.youtube,
      valueYourTradeDesc: valueYourTradeDesc ?? this.valueYourTradeDesc,
      carFinderDesc: carFinderDesc ?? this.carFinderDesc,
      loanAppDesc: loanAppDesc ?? this.loanAppDesc,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      frkDealershipId: frkDealershipId ?? this.frkDealershipId,
    );
  }
}
