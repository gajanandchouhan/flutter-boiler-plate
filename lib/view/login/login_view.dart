import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/bloc.dart';
import 'package:myapp/bloc/login/login_bloc.dart';
import 'package:myapp/view/home/home.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var passwordFieldController = TextEditingController();
  var userNameFiledController = TextEditingController();
  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginSuccess) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.error != null) {
          return AlertDialog(
            content: Text('Invalid user name or password'),
            actions: [
              FlatButton(
                  onPressed: () {
                    _loginBloc.add(LoginReset());
                  },
                  child: Text('OK'))
            ],
          );
        } else if (state.user != null) {
          String user = state.user.name;
          return HomeView(user: user);
        }
      }
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameFiledController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              maxLength: 70,
              decoration: InputDecoration(counterText: '', labelText: 'Email'),
            ),
            TextField(
              controller: passwordFieldController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              obscureText: true,
              maxLines: 1,
              maxLength: 20,
              decoration: InputDecoration(
                counterText: '',
                labelText: 'Password',
              ),
            ),
            RaisedButton(
              onPressed: () {
                _loginBloc.add(LoginButtonPressed(userNameFiledController.text,
                    passwordFieldController.text));
              },
              child: Text('Login'),
              color: Colors.amber,
              textColor: Colors.white,
            )
          ],
        ),
      );
    }));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
