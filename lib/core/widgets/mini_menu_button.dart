import 'package:flutter/material.dart';

class MiniMenuButton extends StatelessWidget {
  const MiniMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert, color: Color(0xFF9ca3af)),
      onPressed: () {},
      padding: EdgeInsets.zero
    );
  }
}