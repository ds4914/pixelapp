class UserModel {
  final String panNumber;
  final String fullName;
  final String mobileNumber;
  final String email;
  final String addressLine1;
  final String addressLine2;
  final String postcode;
  final String state;
  final String city;

  UserModel({
    required this.panNumber,
    required this.fullName,
    required this.mobileNumber,
    required this.email,
    required this.addressLine1,
    required this.addressLine2,
    required this.postcode,
    required this.state,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      panNumber: json['panNumber'],
      fullName: json['fullName'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      postcode: json['postcode'],
      state: json['state'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'panNumber': panNumber,
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'email': email,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'postcode': postcode,
      'state': state,
      'city': city,
    };
  }
}
