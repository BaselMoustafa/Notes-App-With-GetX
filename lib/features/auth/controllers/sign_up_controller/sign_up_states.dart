abstract class SignUpStates{} 

class SignUpInitialState extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpFailedState extends SignUpStates{
  final String message;
  SignUpFailedState({required this.message});
}

class SignUpSuccessState extends SignUpStates{}