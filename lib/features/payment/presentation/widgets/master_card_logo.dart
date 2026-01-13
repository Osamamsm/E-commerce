import 'package:flutter/material.dart';

class MasterCardLogo extends StatelessWidget {
  const MasterCardLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFEB001B),
            shape: BoxShape.circle,
          ),
        ),
        Transform.translate(
          offset: const Offset(-16, 0),
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFFF79E1B),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
