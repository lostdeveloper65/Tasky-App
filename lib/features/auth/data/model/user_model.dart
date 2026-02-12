class UserModel {
  static String collection = 'Users';
  UserModel({this.email, this.id, this.password, this.userName});

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        email: json['email'] as String,
        userName: json['user_name'] as String,
        password: json['password'] as String,
        id: json['id'] as String,
      );

  String? userName;
  String? email;
  String? id;
  String? password;

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "user_name": userName,
      "password": password,
      "id": id,
    };
  }
}
