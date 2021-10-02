import 'package:flutter/material.dart';
import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';
import 'package:flutter_onsignal/ui/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final useCase = context.read<OneSignalInitialUseCase>();
    //useCase.initOneSignal();
    context.read<HomeViewModel>().init();
    return Scaffold(
        body: Center(
          child: Container(
            key: const ValueKey("value"),
            child: const Text("data"),
          ),
        ),
    );
  }
}