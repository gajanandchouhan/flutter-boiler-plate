import 'package:bloc/bloc.dart';
import 'package:myapp/bloc/login/login_event.dart';
import 'package:myapp/bloc/login/login_state.dart';
import 'package:myapp/model/user.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginSuccess(user: null, isLoading: false, error: null));
  final String u = 'gchouhan';
  final String p = '123456';

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      String userName = event.userName;
      String passeword = event.password;
      yield LoginSuccess(user: null, isLoading: true, error: null);
      await Future.delayed(Duration(seconds: 5));
      if (userName == u && passeword == p) {
        yield LoginSuccess(user: User(userName), isLoading: false, error: null);
      } else {
        yield LoginSuccess(
            user: null,
            isLoading: false,
            error: 'Invalid username or password');
      }
    } else if (event is LoginReset) {
      yield LoginSuccess(user: null, isLoading: false, error: null);
    }
  }
}
