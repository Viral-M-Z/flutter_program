class SignUpModel {
  Data? data;

  SignUpModel({this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? phoneNumber;
  String? profession;

  Data(
      {this.firstName,
        this.lastName,
        this.password,
        this.email,
        this.phoneNumber,
        this.profession});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['profession'] = profession;
    return data;
  }
}
