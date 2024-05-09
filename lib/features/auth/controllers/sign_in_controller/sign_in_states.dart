abstract class SignInStates{} 

class SignInInitialState extends SignInStates{}

class SignInLoadingState extends SignInStates{}

class SignInFailedState extends SignInStates{
  final String message;
  SignInFailedState({required this.message});
}

class SignInSuccessState extends SignInStates{}