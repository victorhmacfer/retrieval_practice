
class User {

  String id;
  String firstName;
  String lastName;
  String email;

  User(this.id, this.firstName, this.lastName, this.email);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(map['id'], map['firstName'], map['lastName'], map['email']);
  }

}
