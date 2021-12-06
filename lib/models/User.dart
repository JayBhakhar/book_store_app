class User {
  String userID;
  String name;
  String email;
  String phoneNo;
  String address;
  String password;

  User({
    this.userID,
    this.name,
    this.email,
    this.phoneNo,
    this.address,
    this.password,
  });

  factory User.fromJson(dynamic json) {
    return User(
        userID: json['_id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        phoneNo: json['phone_number'] as String,
        address: json['address'] as String,
        password: json['password'] as String);
  }
  static List<User> listFromJson(list) =>
      List<User>.from(list.map((x) => User.fromJson(x)));
}