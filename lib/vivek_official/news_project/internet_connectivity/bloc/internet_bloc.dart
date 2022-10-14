import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/vivek_official/news_project/internet_connectivity/bloc/internet_events.dart';
import 'package:flutter_sample/vivek_official/news_project/internet_connectivity/bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvents, InternetState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  InternetBloc() : super(InternetInitalState()) {
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetConnectedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
