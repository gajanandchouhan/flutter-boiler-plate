abstract class LoginEvent{}

class LoginButtonPressed extends LoginEvent{
  final String userName;
  final String password;

  LoginButtonPressed(this.userName, this.password);

}

class LoginReset extends LoginEvent{

}