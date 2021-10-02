import 'package:flutter/material.dart';
import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel(this._oneSignalInitialUseCase);
  final OneSignalInitialUseCase _oneSignalInitialUseCase;

  void init() {
    print("Entro al init");
    _oneSignalInitialUseCase.initOneSignal();
  }
}