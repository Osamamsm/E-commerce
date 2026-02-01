import 'package:flutter/material.dart';

void showSelectorBottomSheet(BuildContext context,String title,List<Map<String, dynamic>> items,String selectedItem,Function(String) onSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1F1534),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...items.map((item) => ListTile(
              title: Text(
                item['label'],
                style: const TextStyle(color: Colors.white),
              ),
              trailing: selectedItem == item['value']
                  ? const Icon(Icons.check, color: Color(0xFF7C3AED))
                  : null,
              onTap: () {
                onSelected(item['value']);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }
