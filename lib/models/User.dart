class User {
  String user_id;
  String userName;
  String email;
  String phone_number;
  String address;
  String passsword;
  int city;
  int country;
  int postindex;
  bool admin;
  bool seller;
  bool confirm_seller;

  User(this.user_id,
      this.userName,
      this.email,
      this.phone_number,
      this.address,
      this.passsword,
      this.city,
      this.country,
      this.postindex,
      this.admin,
      this.seller,
      this.confirm_seller,);

  factory User.fromJson(dynamic json) {
    return User(
      json['_id'] as String,
      json['userName'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
      json['address'] as String,
      json['passsword'] as String,
      json['city'] as int,
      json['country'] as int,
      json['postindex'] as int,
      json['admin'] as bool,
      json['seller'] as bool,
      json['confirmSeller'] as bool,
    );
  }

  @override
  String toString() {
    return '{ ${this.user_id}, ${this.userName}, ${this.email}, ${this
        .phone_number},'
        '${this.address}, ${this.passsword}, ${this.city}, ${this.country},'
        '${this.postindex}, ${this.admin}, ${this.seller}, ${this
        .confirm_seller},'
        '}';
  }
}