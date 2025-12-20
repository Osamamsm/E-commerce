import 'package:e_commerce/core/widgets/blurry_background.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.title, required this.child});

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BlurryBackground(),
          Column(
            children: [
              AppBar(backgroundColor: Colors.transparent, title: Text(title)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
