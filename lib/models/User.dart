class User {
  String userID;
  String userName;
  String email;
  String phoneNo;
  String address;
  String password;
  String city;
  String zipCode;
  bool isSeller;

  User({
    this.userID,
    this.userName,
    this.email,
    this.phoneNo,
    this.address,
    this.password,
    this.city,
    this.zipCode,
    this.isSeller,
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
      zipCode: json['zip_code'] as String,
      isSeller: json['is_seller'] as bool,
    );
  }
  static List<User> listFromJson(list) =>
      List<User>.from(list.map((x) => User.fromJson(x)));
}
