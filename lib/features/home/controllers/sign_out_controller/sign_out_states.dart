abstract class SignOutStates{} 

class SignOutInitialState extends SignOutStates{}

class SignOutLoadingState extends SignOutStates{}

class SignOutFailedState extends SignOutStates{
  final String message;
  SignOutFailedState({required this.message});
}

class SignOutSuccessState extends SignOutStates{}