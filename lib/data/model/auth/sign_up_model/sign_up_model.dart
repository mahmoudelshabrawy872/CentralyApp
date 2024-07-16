class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final bool? agree;
  final String company;
  final String password;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.agree,
    required this.company,
    required this.password,
  });
}
