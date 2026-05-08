import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SortOption {
  newest('Newest', Icons.fiber_new_outlined),
  priceAsc('Price: Low–High', Icons.arrow_upward),
  priceDesc('Price: High–Low', Icons.arrow_downward),
  rating('Top Rated', Icons.star_outline),
  popular('Most Popular', Icons.local_fire_department_outlined);

  final String label;
  final IconData icon;
  const SortOption(this.label, this.icon);

  String get shortLabel => label.contains(':') ? label.split(':').first : label;
}

class ProductFilterState {
  final SortOption sortBy;
  final bool onSaleOnly;
  final double? minRating;
  final RangeValues? priceRange;

  const ProductFilterState({
    this.sortBy = SortOption.newest,
    this.onSaleOnly = false,
    this.minRating,
    this.priceRange,
  });

  bool get hasActiveFilters =>
      onSaleOnly || minRating != null || priceRange != null;

  ProductFilterState copyWith({
    SortOption? sortBy,
    bool? onSaleOnly,
    double? minRating,
    RangeValues? priceRange,
    bool clearMinRating = false,
    bool clearPriceRange = false,
  }) {
    return ProductFilterState(
      sortBy: sortBy ?? this.sortBy,
      onSaleOnly: onSaleOnly ?? this.onSaleOnly,
      minRating: clearMinRating ? null : (minRating ?? this.minRating),
      priceRange: clearPriceRange ? null : (priceRange ?? this.priceRange),
    );
  }

  ProductFilterState clearFilters() => ProductFilterState(sortBy: sortBy);
}

class ProductsFilterSortBar extends StatefulWidget {
  final double maxPrice;
  const ProductsFilterSortBar({super.key, this.maxPrice = 500});

  @override
  State<ProductsFilterSortBar> createState() => _ProductsFilterSortBarState();
}

class _ProductsFilterSortBarState extends State<ProductsFilterSortBar> {
  ProductFilterState _filters = const ProductFilterState();

  void _apply(ProductFilterState updated) {
    setState(() => _filters = updated);
    context.read<ProductFeedCubit>().setFilters(updated);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _SortChip(
            currentSort: _filters.sortBy,
            onTap: () => _showSortSheet(context),
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'On Sale',
            icon: Icons.local_offer_outlined,
            isActive: _filters.onSaleOnly,
            onTap: () =>
                _apply(_filters.copyWith(onSaleOnly: !_filters.onSaleOnly)),
          ),
          hGap(8),
          _FilterChip(
            label: _filters.minRating != null
                ? '${_filters.minRating!.toStringAsFixed(0)}★ & up'
                : 'Rating',
            icon: Icons.star_outline,
            isActive: _filters.minRating != null,
            onTap: () => _showRatingSheet(context),
          ),
          hGap(8),
          _FilterChip(
            label: _filters.priceRange != null
                ? '\$${_filters.priceRange!.start.toInt()}–\$${_filters.priceRange!.end.toInt()}'
                : 'Price',
            icon: Icons.attach_money,
            isActive: _filters.priceRange != null,
            onTap: () => _showPriceSheet(context),
          ),
          if (_filters.hasActiveFilters) ...[
            hGap(8),
            _ClearChip(onTap: () => _apply(_filters.clearFilters())),
          ],
        ],
      ),
    );
  }

  void _showSortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF120830),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => _SortBottomSheet(
        current: _filters.sortBy,
        onSelected: (selected) {
          Navigator.pop(context);
          _apply(_filters.copyWith(sortBy: selected));
        },
      ),
    );
  }

  void _showRatingSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF120830),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => _RatingBottomSheet(
        currentRating: _filters.minRating,
        onSelected: (rating) {
          Navigator.pop(context);
          _apply(_filters.copyWith(minRating: rating));
        },
        onCleared: () {
          Navigator.pop(context);
          _apply(_filters.copyWith(clearMinRating: true));
        },
      ),
    );
  }

  void _showPriceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF120830),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      isScrollControlled: true,
      builder: (_) => _PriceRangeBottomSheet(
        maxPrice: widget.maxPrice,
        currentRange: _filters.priceRange,
        onApplied: (range) {
          Navigator.pop(context);
          _apply(_filters.copyWith(priceRange: range));
        },
        onCleared: () {
          Navigator.pop(context);
          _apply(_filters.copyWith(clearPriceRange: true));
        },
      ),
    );
  }
}

class _SortChip extends StatelessWidget {
  final SortOption currentSort;
  final VoidCallback onTap;

  const _SortChip({required this.currentSort, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF7C3AED),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7C3AED).withValues(alpha: .35),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.sort_rounded, color: Colors.white, size: 15),
            const SizedBox(width: 6),
            Text(
              currentSort.shortLabel,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 3),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF7C3AED) : const Color(0xFF1E1040),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isActive ? const Color(0xFF7C3AED) : const Color(0x44FFFFFF),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white54,
              size: 14,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white60,
                fontSize: 13,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClearChip extends StatelessWidget {
  final VoidCallback onTap;

  const _ClearChip({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.redAccent.withValues(alpha: 0.55)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.close_rounded, color: Colors.redAccent, size: 14),
            SizedBox(width: 4),
            Text(
              'Clear',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SortBottomSheet extends StatelessWidget {
  final SortOption current;
  final void Function(SortOption) onSelected;

  const _SortBottomSheet({required this.current, required this.onSelected});

  static const _purple = Color(0xFF7C3AED);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Sort By',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...SortOption.values.map((option) {
            final isSelected = option == current;
            return ListTile(
              leading: Icon(
                option.icon,
                color: isSelected ? _purple : Colors.white54,
                size: 20,
              ),
              title: Text(
                option.label,
                style: TextStyle(
                  color: isSelected ? _purple : Colors.white,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_rounded, color: _purple, size: 18)
                  : null,
              onTap: () => onSelected(option),
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _RatingBottomSheet extends StatefulWidget {
  final double? currentRating;
  final void Function(double rating) onSelected;
  final VoidCallback onCleared;

  const _RatingBottomSheet({
    required this.currentRating,
    required this.onSelected,
    required this.onCleared,
  });

  @override
  State<_RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<_RatingBottomSheet> {
  double? _selected;

  static const _purple = Color(0xFF7C3AED);
  static const _starColor = Color(0xFFFBBF24);
  static const _options = [1.0, 2.0, 3.0, 4.0];

  @override
  void initState() {
    super.initState();
    _selected = widget.currentRating;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Minimum Rating',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Show products rated at least…',
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
            const SizedBox(height: 24),

            // Star option cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _options.map((rating) {
                final isSelected = _selected == rating;
                return GestureDetector(
                  onTap: () => setState(() => _selected = rating),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 72,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? _purple : const Color(0xFF1E1040),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected ? _purple : Colors.white12,
                        width: 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: _purple.withValues(alpha: 0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Stars row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            rating.toInt(),
                            (_) => const Icon(
                              Icons.star_rounded,
                              color: _starColor,
                              size: 13,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${rating.toInt()}★ & up',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white60,
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 28),

            // Action buttons
            Row(
              children: [
                // Clear button — only visible when a rating is active
                if (widget.currentRating != null) ...[
                  Expanded(
                    child: _SheetOutlineButton(
                      label: 'Clear',
                      onTap: widget.onCleared,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  flex: 2,
                  child: _SheetFilledButton(
                    label: 'Apply',
                    enabled: _selected != null,
                    onTap: _selected != null
                        ? () => widget.onSelected(_selected!)
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRangeBottomSheet extends StatefulWidget {
  final double maxPrice;
  final RangeValues? currentRange;
  final void Function(RangeValues range) onApplied;
  final VoidCallback onCleared;

  const _PriceRangeBottomSheet({
    required this.maxPrice,
    required this.currentRange,
    required this.onApplied,
    required this.onCleared,
  });

  @override
  State<_PriceRangeBottomSheet> createState() => _PriceRangeBottomSheetState();
}

class _PriceRangeBottomSheetState extends State<_PriceRangeBottomSheet> {
  late RangeValues _range;

  static const _purple = Color(0xFF7C3AED);

  @override
  void initState() {
    super.initState();
    _range = widget.currentRange ?? RangeValues(0, widget.maxPrice);
  }

  String _fmt(double value) => '\$${value.toInt()}';

  @override
  Widget build(BuildContext context) {
    final bool isDirty = _range.start != 0 || _range.end != widget.maxPrice;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Price Range',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 28),

            // Min / Max labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PriceLabel(title: 'Min', value: _fmt(_range.start)),
                _PriceLabel(
                  title: 'Max',
                  value: _range.end >= widget.maxPrice
                      ? '${_fmt(widget.maxPrice)}+'
                      : _fmt(_range.end),
                  alignRight: true,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Range slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: _purple,
                inactiveTrackColor: Colors.white12,
                thumbColor: Colors.white,
                overlayColor: _purple.withValues(alpha: 0.2),
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 10,
                ),
                trackHeight: 4,
                overlappingShapeStrokeColor: _purple,
              ),
              child: RangeSlider(
                values: _range,
                min: 0,
                max: widget.maxPrice,
                divisions: (widget.maxPrice / 10).round(),
                onChanged: (v) => setState(() => _range = v),
              ),
            ),

            const SizedBox(height: 8),

            // Min / Max extremes hint
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _fmt(0),
                  style: const TextStyle(color: Colors.white30, fontSize: 11),
                ),
                Text(
                  '${_fmt(widget.maxPrice)}+',
                  style: const TextStyle(color: Colors.white30, fontSize: 11),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Action buttons
            Row(
              children: [
                if (widget.currentRange != null) ...[
                  Expanded(
                    child: _SheetOutlineButton(
                      label: 'Clear',
                      onTap: widget.onCleared,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  flex: 2,
                  child: _SheetFilledButton(
                    label: 'Apply',
                    enabled: isDirty,
                    onTap: isDirty ? () => widget.onApplied(_range) : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetFilledButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback? onTap;

  const _SheetFilledButton({
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  static const _purple = Color(0xFF7C3AED);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        decoration: BoxDecoration(
          color: enabled ? _purple : Colors.white12,
          borderRadius: BorderRadius.circular(14),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: _purple.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: enabled ? Colors.white : Colors.white38,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _SheetOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SheetOutlineButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white24),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _PriceLabel extends StatelessWidget {
  final String title;
  final String value;
  final bool alignRight;

  const _PriceLabel({
    required this.title,
    required this.value,
    this.alignRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignRight
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white38, fontSize: 11),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
