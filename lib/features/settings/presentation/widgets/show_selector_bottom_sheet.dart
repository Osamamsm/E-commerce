import 'package:flutter/material.dart';

void showSelectorBottomSheet(
  BuildContext context,
  String title,
  List<Map<String, dynamic>> items,
  String selectedItem,
  Function(String) onSelected,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final cs = Theme.of(context).colorScheme;
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: cs.onSurface.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ...items.map((item) => ListTile(
              title: Text(
                item['label'],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: selectedItem == item['value']
                  ? Icon(Icons.check_rounded, color: cs.primary)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () {
                onSelected(item['value']);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      );
    },
  );
}
