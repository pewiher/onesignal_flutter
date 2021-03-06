import 'package:onesignal_flutter/onesignal_flutter.dart';

abstract class OneSignalRepository {
  initialize(String apiKey);
  Stream<OSNotification> get onNotification;
  Stream<OSInAppMessageAction> get onInApp;
  Future<Map<String, dynamic>> setExternalUserId(String userId);
  void dispose();
}