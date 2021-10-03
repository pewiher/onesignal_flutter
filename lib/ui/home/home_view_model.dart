import 'package:flutter/material.dart';
import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel(this._oneSignalInitialUseCase);
  final OneSignalInitialUseCase _oneSignalInitialUseCase;

  void init() {
    _oneSignalInitialUseCase.initOneSignal();
  }

  Stream<OSNotification> getStream() => _oneSignalInitialUseCase.getOnNotification();
}