class User {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? token;
  String? renewalToken;
  String? activeVehicles;

  User(
      {this.email,
        this.firstName,
        this.lastName,
        this.token,
        this.renewalToken,
        this.activeVehicles});

  factory User.fromJson(Map<String, dynamic> responseData) {

    return User(
      email: responseData['email'],
      firstName: responseData['firstName'],
      lastName: responseData['lastName'],
      token: responseData['token'],
      renewalToken: responseData['renewal_token'],
    );
  }
}
