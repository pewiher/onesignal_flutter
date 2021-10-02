import 'package:flutter_onsignal/data/repositories/onesignal_repository.dart';

class OneSignalInitialUseCase {
  OneSignalInitialUseCase(this._oneSignalRepository, this.apiKey);
  final String apiKey;
  final OneSignalRepository _oneSignalRepository;

  initOneSignal() {
    _oneSignalRepository.initialize(apiKey);
  }
}