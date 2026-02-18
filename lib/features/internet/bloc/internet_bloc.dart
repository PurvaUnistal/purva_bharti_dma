import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription<List<ConnectivityResult>>? subscription;

  bool isConnected = false;
  bool isWifi = false;
  bool isMobile = false;

  InternetBloc() : super(InternetInitState()) {
    on<OnConnectedEvent>(_connected);
    on<NotConnectedEvent>(_notConnected);

    subscription = Connectivity().onConnectivityChanged.listen((results) {
      bool hasWifi = results.contains(ConnectivityResult.wifi);
      bool hasMobile = results.contains(ConnectivityResult.mobile);
      bool hasNone = results.contains(ConnectivityResult.none);

      isConnected = !hasNone;
      isWifi = hasWifi;
      isMobile = hasMobile;

      if (isConnected) {
        add(OnConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  void _connected(OnConnectedEvent event, Emitter<InternetState> emit) {
    emit(ConnectedState(
      msg: isConnected ? "Connected" : "Not Connected",
      isConnected: isConnected,
      isWifi: isWifi,
      isMobile: isMobile,
    ));
  }

  void _notConnected(NotConnectedEvent event, Emitter<InternetState> emit) {
    emit(NotConnectedState(msg: "Not Connected"));
  }
}
