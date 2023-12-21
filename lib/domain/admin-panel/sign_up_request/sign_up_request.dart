class SignUpRequest {
  int id;
  String bussinessName;
  String dealershipLicenceNumber;
  String businessPhone;
  String businessFax;
  String businessStreet;
  String businessPostal;
  String businessWebsite;
  String ownerFirstname;
  String ownerLastname;
  String ownerPhoneNumber;
  String ownerEmail;
  String mailingStreet;
  String mailingPostal;
  String primaryFirstname;
  String primaryLastname;
  String primaryPhoneNumber;
  String primaryEmail;
  String longitude;
  String latitude;
  int status;
  int frkDealerOwnerUserId;
  int frkMailingCityId;
  String rejectMessageSMS;
  String rejectMessageEmail;
  String acceptMessageSMS;
  String acceptMessageEmail;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  int frkBusinessCityId;

  SignUpRequest(
      {this.id,
      this.bussinessName,
      this.dealershipLicenceNumber,
      this.businessPhone,
      this.businessFax,
      this.businessStreet,
      this.businessPostal,
      this.businessWebsite,
      this.ownerFirstname,
      this.ownerLastname,
      this.ownerPhoneNumber,
      this.ownerEmail,
      this.mailingStreet,
      this.mailingPostal,
      this.primaryFirstname,
      this.primaryLastname,
      this.primaryPhoneNumber,
      this.primaryEmail,
      this.longitude,
      this.latitude,
      this.status,
      this.frkDealerOwnerUserId,
      this.frkMailingCityId,
      this.rejectMessageSMS,
      this.rejectMessageEmail,
      this.acceptMessageSMS,
      this.acceptMessageEmail,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.frkBusinessCityId});

  SignUpRequest.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    bussinessName = json['bussiness_name'];
    dealershipLicenceNumber = json['dealership_licence_number'];
    businessPhone = json['business_phone'];
    businessFax = json['business_fax'];
    businessStreet = json['business_street'];
    businessPostal = json['business_postal'];
    businessWebsite = json['business_website'];
    ownerFirstname = json['owner_firstname'];
    ownerLastname = json['owner_lastname'];
    ownerPhoneNumber = json['owner_phone_number'];
    ownerEmail = json['owner_email'];
    mailingStreet = json['mailing_street'];
    mailingPostal = json['mailing_postal'];
    primaryFirstname = json['primary_firstname'];
    primaryLastname = json['primary_lastname'];
    primaryPhoneNumber = json['primary_phone_number'];
    primaryEmail = json['primary_email'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    status = json['status'];
    frkDealerOwnerUserId = json['frk_dealer_owner_user_id'];
    frkMailingCityId = json['frk_mailing_city_id'];
    rejectMessageSMS = json['reject_message_SMS'];
    rejectMessageEmail = json['reject_message_email'];
    acceptMessageSMS = json['accept_message_SMS'];
    acceptMessageEmail = json['accept_message_email'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    frkBusinessCityId = json['frk_business_city_id'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bussiness_name'] = this.bussinessName;
    data['dealership_licence_number'] = this.dealershipLicenceNumber;
    data['business_phone'] = this.businessPhone;
    data['business_fax'] = this.businessFax;
    data['business_street'] = this.businessStreet;
    data['business_postal'] = this.businessPostal;
    data['business_website'] = this.businessWebsite;
    data['owner_firstname'] = this.ownerFirstname;
    data['owner_lastname'] = this.ownerLastname;
    data['owner_phone_number'] = this.ownerPhoneNumber;
    data['owner_email'] = this.ownerEmail;
    data['mailing_street'] = this.mailingStreet;
    data['mailing_postal'] = this.mailingPostal;
    data['primary_firstname'] = this.primaryFirstname;
    data['primary_lastname'] = this.primaryLastname;
    data['primary_phone_number'] = this.primaryPhoneNumber;
    data['primary_email'] = this.primaryEmail;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['status'] = this.status;
    data['frk_dealer_owner_user_id'] = this.frkDealerOwnerUserId;
    data['frk_mailing_city_id'] = this.frkMailingCityId;
    data['reject_message_SMS'] = this.rejectMessageSMS;
    data['reject_message_email'] = this.rejectMessageEmail;
    data['accept_message_SMS'] = this.acceptMessageSMS;
    data['accept_message_email'] = this.acceptMessageEmail;
    data['frk_business_city_id'] = this.frkBusinessCityId;
    return data;
  }
}
