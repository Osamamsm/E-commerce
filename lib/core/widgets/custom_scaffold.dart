import 'package:e_commerce/core/widgets/blurry_background.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.title, required this.child, this.actionWidgets});

  final String? title;
  final Widget child;
  final List<Widget>? actionWidgets;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const BlurryBackground(),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text(title??''),
                centerTitle: true,
                actions: actionWidgets,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: child,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
