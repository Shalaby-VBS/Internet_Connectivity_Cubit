// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription? subscription;
  InternetConnectionCubit() : super(InternetConnectionInitial());

  // MARK: - Stream Subscription to listen to internet connection changes.
  void checkConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        emit(InternetConnectedState('Internet Connected'));
      } else {
        emit(InternetNotConnectedState('Internet Not Connected'));
      }
    });
  }

  // MARK: - Close the subscription when the bloc is closed.
  @override
  Future<void> closeSubscription() {
    subscription?.cancel();
    return super.close();
  }
}
