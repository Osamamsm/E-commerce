import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

static String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SplashView'),
      ),
    );
  }
}