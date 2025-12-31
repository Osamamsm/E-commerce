import 'package:e_commerce/features/product_details/presentation/widgets/color_selector.dart';
import 'package:flutter/material.dart';

class ProductColorSelector extends StatefulWidget {
  const ProductColorSelector({super.key});

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ColorSelector(
      colors: [
        {"color": Colors.red, "name": 'Red'},
        {"color": Colors.green, "name": 'Green'},
        {"color": Colors.blue, "name": 'Blue'},
        {"color": Colors.yellow, "name": 'Yellow'},
        {"color": Colors.purple, "name": 'Purple'},
        {"color": Colors.orange, "name": 'Orange'},
        {"color": Colors.pink, "name": 'Pink'},
        {"color": Colors.brown, "name": 'Brown'},
        {"color": Colors.grey, "name": 'Grey'},
        {"color": Colors.black, "name": 'Black'},
        {"color": Colors.white, "name": 'White'},
      ],
      size: 40,
      selectedIndex: selectedIndex,
      activeBorderColor: const Color(0xFF6C83FF),
      onChanged: (index) {
        if (selectedIndex == index) return;
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
