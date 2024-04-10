import 'package:pbg_app/ExportFile/export_file.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;
  bool isConnected = false;
  bool isWifi = false;
  bool isMobile = false;

  InternetBloc() : super(InternetInitState()) {
    on<OnConnectedEvent>(_connected);
    on<NotConnectedEvent>(_notConnected);

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult? result) {
      if (result == ConnectivityResult.wifi) {
        isConnected = true;
        isWifi = true;
        isMobile = false;
        add(OnConnectedEvent());
      } else if (result == ConnectivityResult.mobile) {
        isConnected = true;
        isWifi = false;
        isMobile = true;
        add(OnConnectedEvent());
      } else if (result == ConnectivityResult.none) {
        isConnected = false;
        isWifi = false;
        isMobile = false;
        add(OnConnectedEvent());
      } else {
        print("result.toString()");
        print(result.toString());
        isConnected = false;
        isWifi = false;
        isMobile = false;
        add(NotConnectedEvent());
      }
    });
  }
  @override
  Future<void> close() {
    subscription!.cancel();
    // TODO: implement close
    return super.close();
  }

  _connected(OnConnectedEvent event, emit) {
    emit(ConnectedState(
        msg: isConnected ? "Connected" : "Not Connected",
        isConnected: isConnected,
        isWifi: isWifi,
        isMobile: isMobile));
  }

  _notConnected(NotConnectedEvent event, emit) {
    emit(NotConnectedState(msg: "Not Connected"));
  }
}
