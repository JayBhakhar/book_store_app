class User {
  String userID;
  String userName;
  String email;
  String phoneNo;
  String address;
  String password;
  String city;
  String zipCode;

  User({
    this.userID,
    this.userName,
    this.email,
    this.phoneNo,
    this.address,
    this.password,
    this.city,
    this.zipCode,
  });

  factory User.fromJson(dynamic json) {
    return User(
        userID: json['_id'] as String,
        userName: json['user_name'] as String,
        email: json['email'] as String,
        phoneNo: json['phone_number'] as String,
        address: json['address'] as String,
        password: json['password'] as String,
        city: json['city'] as String,
        zipCode: json['zip_code'] as String);
  }
  static List<User> listFromJson(list) =>
      List<User>.from(list.map((x) => User.fromJson(x)));
}
