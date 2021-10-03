import 'package:flutter_onsignal/data/repositories/onesignal_repository.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalInitialUseCase {
  OneSignalInitialUseCase(this._oneSignalRepository, this.apiKey);
  final String apiKey;
  final OneSignalRepository _oneSignalRepository;

  initOneSignal() {
    _oneSignalRepository.initialize(apiKey);
  }

  Stream<OSNotification> getOnNotification() => _oneSignalRepository.onNotification;
  
}