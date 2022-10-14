import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { initial, connected, lost }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  InternetCubit() : super(InternetState.initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetState.connected);
      } else {
        emit(InternetState.lost);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
