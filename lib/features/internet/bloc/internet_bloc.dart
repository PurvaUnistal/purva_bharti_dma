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
      _update(results);
      add(isConnected ? OnConnectedEvent() : NotConnectedEvent());
    });
  }

  void _update(List<ConnectivityResult> results) {
    isWifi = results.contains(ConnectivityResult.wifi);
    isMobile = results.contains(ConnectivityResult.mobile);
    isConnected = results.any((r) => r != ConnectivityResult.none);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  /// Dashboard se call hota hai — yahan khud current status check karo
  Future<void> _connected(
      OnConnectedEvent event, Emitter<InternetState> emit) async {
    _update(await Connectivity().checkConnectivity());

    if (isConnected) {
      emit(ConnectedState(
        msg: "Connected",
        isConnected: true,
        isWifi: isWifi,
        isMobile: isMobile,
      ));
    } else {
      emit(NotConnectedState(msg: "No internet available"));
    }
  }

  void _notConnected(NotConnectedEvent event, Emitter<InternetState> emit) {
    isConnected = false;
    isWifi = false;
    isMobile = false;
    emit(NotConnectedState(msg: "No internet available"));
  }
}