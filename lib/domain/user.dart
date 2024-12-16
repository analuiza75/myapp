class User {
  late String email;
  late String password;

  User(this.email, this.password);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['email'] = email;
    json['password'] = password;

    return json;
  }
}