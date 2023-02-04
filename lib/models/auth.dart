enum AuthType {
  email,
  apple,
  google,
  facebook,
}

class Authentication {
  String? email;
  String? password;
  String? name;
  AuthType type;
  String? phone;

  Authentication(this.type, {this.name, this.email, this.password, this.phone});
}