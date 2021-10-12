import 'package:flutter/material.dart';
import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';
import 'package:flutter_onsignal/ui/home/home_view_model.dart';
import 'package:flutter_onsignal/ui/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  static const String routeName = "splash";
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SplashViewModel>();
    
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel(
        context.read<OneSignalInitialUseCase>(),
        
      )..init(context),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            viewModel.init(context);
            return Container(
              key: const ValueKey("splash"),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20,),
                    Text("Cargando datos....")
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}