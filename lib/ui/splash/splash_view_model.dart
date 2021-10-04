import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onsignal/ui/home/home_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel(this._oneSignalInitialUseCase);
  final OneSignalInitialUseCase _oneSignalInitialUseCase;
  

  void init(BuildContext context) async {
    _oneSignalInitialUseCase.initOneSignal();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.pushNamed(context, HomeView.routeName);
    });
    
  }

  Stream<OSNotification> getStream() => _oneSignalInitialUseCase.getOnNotification();


}