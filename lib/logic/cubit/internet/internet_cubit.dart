import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  // * Connectivity
  final _connectivity = Connectivity();

  // * Connectivity Stream
  late StreamSubscription _connectivityStreamSubscription;

  InternetCubit() : super(InternetInitial()) {
    _monitorInternetConnection();
  }

  StreamSubscription<List<ConnectivityResult>> _monitorInternetConnection() {
    return _connectivityStreamSubscription =
        _connectivity.onConnectivityChanged.listen((_) => _validateInternetConnection());
  }

  Future<void> _validateInternetConnection() async {
    // * Try
    try {
      // * Await Look Result
      final result = await InternetAddress.lookup('example.com');
      // * If Result Not Empty [Emit Internet Connected]
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) emit(InternetConnected());
    }
    // ! On Error
    on SocketException catch (_) {
      // * Emit Internet Disconnect
      emit(InternetDisconnect());
      // * Validate Internet Connection Every 5 Seconds
      Future.delayed(const Duration(seconds: 5), () => _validateInternetConnection());
    }
  }

  @override
  Future<void> close() {
    _connectivityStreamSubscription.cancel();
    return super.close();
  }
}
