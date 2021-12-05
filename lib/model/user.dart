class User {
  int id;
  String username;
  String password;
  String name;
  String surname;
  String mail;
  String valid;

  User(
      {this.id,
      this.username,
      this.surname,
      this.password,
      this.name,
      this.mail,
      this.valid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        surname: json['surname'],
        name: json['name'],
        mail: json['mail'],
        valid: json['valid']);
  }
}
