import 'package:flutter/foundation.dart';
import 'package:myapp/model/user.dart';

abstract class LoginState {}


class LoginSuccess extends LoginState {
  final User user;
  final bool isLoading;
  final String error;

  LoginSuccess({@required this.user, @required this.isLoading, @required this.error});

}
