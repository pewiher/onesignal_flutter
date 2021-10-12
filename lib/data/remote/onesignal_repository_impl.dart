import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_onsignal/data/repositories/onesignal_repository.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalRepositoryImpl implements OneSignalRepository {

  OneSignalRepositoryImpl(this._oneSignal);
  
  final OneSignal _oneSignal;
  final _controller = StreamController<OSNotification>.broadcast();
  final _controllerInApp = StreamController<OSInAppMessageAction>.broadcast();

  @override
  Stream<OSNotification> get onNotification => _controller.stream;

  @override
  Stream<OSInAppMessageAction> get onInApp => _controllerInApp.stream;


  @override
  initialize(String apiKey) {
    //if (kDebugMode) _oneSignal.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    _oneSignal.setAppId(apiKey);

    if(Platform.isIOS) _oneSignal.promptUserForPushNotificationPermission();
    
    _oneSignal.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      final notification = event.notification;
      event.complete(notification);

      if(_controller.hasListener){
        _controller.sink.add(notification);
      }

    });

    
    //Cuando da click
    //Background y app terminated
    _oneSignal.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      final notification = result.notification;
      if(result.action != null){
        if(result.action!.type == OSNotificationActionType.actionTaken){
          print("Dio click en boton ${result.action?.actionId}");
        } else {
          print("Dio click en boton ${result.action?.actionId}");
        }
      }
          
      
      if(_controller.hasListener){
        _controller.sink.add(notification);
      }
    });


    // _oneSignal.setPermissionObserver((OSPermissionStateChanges changes) {
    //     // Will be called whenever the permission changes
    //     // (ie. user taps Allow on the permission prompt in iOS)
    // });

    // _oneSignal.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    //     // Will be called whenever the subscription changes 
    //     // (ie. user gets registered with OneSignal and gets a user ID)
    //     print(changes.from.pushToken);
    //     print(changes.to.pushToken);
    // });

    // _oneSignal.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
    //     // Will be called whenever then user's email subscription changes
    //     // (ie. OneSignal.setEmail(email) is called and the user gets registered
    // });

    _oneSignal.setInAppMessageClickedHandler((action) {
      print("Entro al boton ${action.clickName}"); //Action ID
      
      _controllerInApp.sink.add(action);
    });
    
  }

  @override
  void dispose(){
    _controller.close();
    _controllerInApp.close();
  }


  @override
  Future<Map<String, dynamic>> setExternalUserId(String userId) {
    return _oneSignal.setExternalUserId(userId);
  }

}