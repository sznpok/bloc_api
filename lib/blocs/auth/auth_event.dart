abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final int phone;
  final String password;

  LoginButtonPressed({required this.phone, required this.password});
}
