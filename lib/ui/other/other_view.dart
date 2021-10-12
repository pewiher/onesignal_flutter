import 'package:flutter/material.dart';

class OtherView extends StatelessWidget {
  static String routeName = "other";
  const OtherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Nada es igual")
            ],
          ),
        ),
      ),
    );
  }
}