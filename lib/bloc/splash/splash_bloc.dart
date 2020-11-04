import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:myapp/bloc/splash/splash_event.dart';
import 'package:myapp/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    final currentState = state;
    print("Map event called");
    if (event is StartDelay) {
      if (currentState is SplashInitial) {
        await Future.delayed(Duration(seconds: 4));
        yield SplashTimeOut();
        return;
      }

    }
  }
}
