import 'package:flutter/widgets.dart';
import 'package:flutter_onsignal/ui/home/home_view.dart';
import 'package:flutter_onsignal/ui/splash/splash_view.dart';

Map <String, WidgetBuilder> getApplicationRoutes() => {
  '/': (_) => const SplashView(),
  HomeView.routeName: (_) => const HomeView(),
};