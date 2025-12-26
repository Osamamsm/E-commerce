import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF8856f7), Color.fromARGB(255, 26, 198, 180)],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(alignment: Alignment.center, height: 48, child: child),
      ),
    );
  }
}
