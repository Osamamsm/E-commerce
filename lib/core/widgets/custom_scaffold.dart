import 'package:e_commerce/core/widgets/blurry_background.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.title,
    required this.child,
    this.actionWidgets,
    this.customBottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.titleWidget,
  });

  final String? title;
  final Widget child;
  final List<Widget>? actionWidgets;
  final Widget? customBottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? titleWidget;
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
                title: titleWidget ?? (title != null ? Text(title!) : null),
                centerTitle: true,
                actions: actionWidgets,
              ),
              Expanded(child: child),
            ],
          ),
        ],
      ),
      bottomNavigationBar: customBottomNavigationBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
