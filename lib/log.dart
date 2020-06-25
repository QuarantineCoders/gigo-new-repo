class Log {
  String id;
  String email;
  String password;

  Log(
    this.id,
    this.email,
    this.password,
  );

  Log.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }
}
