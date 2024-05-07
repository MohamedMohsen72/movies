class AuthStates {}

class AuthInitStates extends AuthStates {}

//login

class LoginLoadingStates extends AuthStates {}

class LoginSuccessStates extends AuthStates {}

class LoginErrorStates extends AuthStates {
  final String error;

  LoginErrorStates({required this.error});
}



//register

class RegisterLoadingStates extends AuthStates {}

class RegisterSuccessStates extends AuthStates {}

class RegisterErrorStates extends AuthStates {
  final String error;

  RegisterErrorStates({required this.error});
}
