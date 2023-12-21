import 'package:abs_customer_sites/domain/core/component/component.dart';

class User {
  int id;
  String fName;
  String lName;
  String username;
  String email;
  String mobile;
  String address;
  String postalcode;
  int active;
  int isActive;
  int gender;
  String birthdate;
  String imageFile;
  int emailVerified;
  String emailExpireTime;
  int mobileVerified;
  String mobileExpireTime;
  String passwordResetExp;
  String createdAt;
  String updatedAt;
  int frkRole;
  List<Component> components;
  User({
    this.id,
    this.fName,
    this.lName,
    this.username,
    this.email,
    this.mobile,
    this.address,
    this.postalcode,
    this.active,
    this.isActive,
    this.gender,
    this.birthdate,
    this.imageFile,
    this.emailVerified,
    this.emailExpireTime,
    this.mobileVerified,
    this.mobileExpireTime,
    this.passwordResetExp,
    this.createdAt,
    this.updatedAt,
    this.frkRole,
    this.components,
  });

  bool hasComponent(String componentName) {
    List comps = components
        .where((component) => component.componentName == componentName)
        .toList();
    if (comps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  User copyWith({
    int id,
    String fName,
    String lName,
    String username,
    String email,
    String mobile,
    String address,
    String postalcode,
    int active,
    int isActive,
    int gender,
    String birthdate,
    String imageFile,
    int emailVerified,
    String emailExpireTime,
    int mobileVerified,
    String mobileExpireTime,
    String passwordResetExp,
    String createdAt,
    String updatedAt,
    int frkRole,
    List<Component> components,
  }) {
    return User(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      username: username ?? this.username,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      postalcode: postalcode ?? this.postalcode,
      active: active ?? this.active,
      isActive: isActive ?? this.isActive,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      imageFile: imageFile ?? this.imageFile,
      emailVerified: emailVerified ?? this.emailVerified,
      emailExpireTime: emailExpireTime ?? this.emailExpireTime,
      mobileVerified: mobileVerified ?? this.mobileVerified,
      mobileExpireTime: mobileExpireTime ?? this.mobileExpireTime,
      passwordResetExp: passwordResetExp ?? this.passwordResetExp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      frkRole: frkRole ?? this.frkRole,
      components: components ?? this.components,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fName': fName,
      'lName': lName,
      'username': username,
      'email': email,
      'mobile': mobile,
      'address': address,
      'postalcode': postalcode,
      'active': active,
      'isActive': isActive,
      'gender': gender,
      'birthdate': birthdate,
      'imageFile': imageFile,
      'emailVerified': emailVerified,
      'emailExpireTime': emailExpireTime,
      'mobileVerified': mobileVerified,
      'mobileExpireTime': mobileExpireTime,
      'passwordResetExp': passwordResetExp,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'frkRole': frkRole,
      'components': components.map((component) {
        component.toJson();
      }).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      fName: map['f_name'],
      lName: map['l_name'],
      username: map['username'],
      email: map['email'],
      mobile: map['mobile'],
      address: map['address'],
      postalcode: map['postalcode'],
      active: map['active'],
      isActive: map['is_active'],
      gender: map['gender'],
      birthdate: map['birthdate'],
      imageFile: map['image_file'],
      emailVerified: map['email_verified'],
      emailExpireTime: map['email_expire_time'],
      mobileVerified: map['mobile_verified'],
      mobileExpireTime: map['mobileExpireTime'],
      passwordResetExp: map['passwordResetExp'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      frkRole: map['frk_role'],
      components: [
        Component(componentName: 'Lead'),
        Component(componentName: 'VehicleManage'),
        Component(componentName: 'Services'),
        Component(componentName: 'Tickets'),
      ],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, fName: $fName, lName: $lName, username: $username, email: $email, mobile: $mobile, address: $address, postalcode: $postalcode, active: $active, isActive: $isActive, gender: $gender, birthdate: $birthdate, imageFile: $imageFile, emailVerified: $emailVerified, emailExpireTime: $emailExpireTime, mobileVerified: $mobileVerified, mobileExpireTime: $mobileExpireTime, passwordResetExp: $passwordResetExp, createdAt: $createdAt, updatedAt: $updatedAt, frkRole: $frkRole)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.fName == fName &&
        other.lName == lName &&
        other.username == username &&
        other.email == email &&
        other.mobile == mobile &&
        other.address == address &&
        other.postalcode == postalcode &&
        other.active == active &&
        other.isActive == isActive &&
        other.gender == gender &&
        other.birthdate == birthdate &&
        other.imageFile == imageFile &&
        other.emailVerified == emailVerified &&
        other.emailExpireTime == emailExpireTime &&
        other.mobileVerified == mobileVerified &&
        other.mobileExpireTime == mobileExpireTime &&
        other.passwordResetExp == passwordResetExp &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.frkRole == frkRole;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fName.hashCode ^
        lName.hashCode ^
        username.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        address.hashCode ^
        postalcode.hashCode ^
        active.hashCode ^
        isActive.hashCode ^
        gender.hashCode ^
        birthdate.hashCode ^
        imageFile.hashCode ^
        emailVerified.hashCode ^
        emailExpireTime.hashCode ^
        mobileVerified.hashCode ^
        mobileExpireTime.hashCode ^
        passwordResetExp.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        frkRole.hashCode;
  }
}
