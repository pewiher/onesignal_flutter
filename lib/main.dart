import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_onsignal/di/dependencies.dart';
import 'package:flutter_onsignal/domain/usecases/onesignal_initial_usecase.dart';
import 'package:flutter_onsignal/routes/routes.dart';
import 'package:flutter_onsignal/ui/home/home_view.dart';
import 'package:flutter_onsignal/ui/home/home_view_model.dart';
import 'package:flutter_onsignal/ui/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories("e1620ff1-0960-4666-a574-99df457aead7"),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel(context.read<OneSignalInitialUseCase>(),)),
          ChangeNotifierProvider(create: (context) => SplashViewModel(context.read<OneSignalInitialUseCase>(),)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
           primarySwatch: Colors.blue,
          ),
          routes: getApplicationRoutes(),
        ),
      ),
    );
  }
}
