import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_widget.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<Category> categories;
  final void Function(Category category) onCategorySelected;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  String? _expandedCategoryId;

  void _handleParentTap(Category category) {
    if (category.subcategories.isEmpty) {
      widget.onCategorySelected(category);
    } else {
      setState(() {
        _expandedCategoryId = _expandedCategoryId == category.id
            ? null
            : category.id;
      });
    }
  }

  String _resolveName(BuildContext context, Category category) {
    return Localizations.localeOf(context).languageCode == 'ar'
        ? category.arName
        : category.enName;
  }

  /// Builds the flat list of items to render:
  /// parents in order, with subcategories injected right after their parent.
  List<({Category category, bool isSubcategory})> get _flatItems {
    final items = <({Category category, bool isSubcategory})>[];
    for (final parent in widget.categories) {
      items.add((category: parent, isSubcategory: false));
      if (parent.id == _expandedCategoryId) {
        for (final sub in parent.subcategories) {
          items.add((category: sub, isSubcategory: true));
        }
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final items = _flatItems;

    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => hGap(14),
        itemBuilder: (context, index) {
          final item = items[index];
          final isExpanded =
              !item.isSubcategory && item.category.id == _expandedCategoryId;

          return CategoryWidget(
            name: _resolveName(context, item.category),
            image: item.category.imageUrl,
            isSelected: isExpanded,
            onTap: item.isSubcategory
                ? () => widget.onCategorySelected(item.category)
                : () => _handleParentTap(item.category),
          );
        },
      ),
    );
  }
}
