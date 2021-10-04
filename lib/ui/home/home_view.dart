import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onsignal/ui/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  late  StreamSubscription _subScription;
  
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<HomeViewModel>();
    viewModel.init();

    _subScription = viewModel.getStream().listen((notification) {
      final snackBar = SnackBar(content: Text(notification.title ?? ""),);
      ScaffoldMessenger.of(_globalKey.currentContext!).showSnackBar(snackBar);
      
    });

  }
  @override
  Widget build(BuildContext context) {
    //final useCase = context.read<OneSignalInitialUseCase>();
    //useCase.initOneSignal();
    
    return Scaffold(
      key: _globalKey,
        body: Center(
          child: Container(
            key: const ValueKey("value"),
            child: const Text("data"),
          ),
        ),
    );
  }
}