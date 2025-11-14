import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';

class SelectionBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final Function(T) onItemSelected;
  final String Function(T) getItemName;
  final String Function(T)? getItemId;
  final String searchHint;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final bool showSearch; // NEW FLAG

  const SelectionBottomSheet({
    Key? key,
    required this.title,
    required this.items,
    this.selectedItem,
    required this.onItemSelected,
    required this.getItemName,
    this.getItemId,
    this.searchHint = 'Cari',
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
    this.showSearch = true, // default true
  }) : super(key: key);

  @override
  State<SelectionBottomSheet<T>> createState() =>
      _SelectionBottomSheetState<T>();
}

class _SelectionBottomSheetState<T> extends State<SelectionBottomSheet<T>> {
  List<T> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateFilteredItems();
  }

  @override
  void didUpdateWidget(SelectionBottomSheet<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _updateFilteredItems();
    }
  }

  void _updateFilteredItems() {
    setState(() {
      filteredItems = widget.items;
    });
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = widget.items;
      } else {
        filteredItems = widget.items
            .where(
              (item) => widget
              .getItemName(item)
              .toLowerCase()
              .contains(query.toLowerCase()),
        )
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: black00,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: bgSurfaceNeutralDark,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(widget.title, style: mdMedium),
          ),

          // Only show search if showSearch = true
          if (widget.showSearch)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderNeutralDark),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: _filterItems,
                  decoration: InputDecoration(
                    hintText: widget.searchHint,
                    hintStyle: smRegular.copyWith(color: textDarkTertiary),
                    prefixIcon: Icon(Icons.search, color: iconDarkTertiary),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 16),

          Expanded(
            child: widget.isLoading
                ? const Center(child: CircularProgressIndicator())
                : widget.errorMessage != null
                ? _buildErrorView()
                : _buildItemList(),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: errorColor,
            ),
            const SizedBox(height: 16),
            Text(
              widget.errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: errorColor),
            ),
            if (widget.onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: widget.onRetry,
                child: const Text('Coba Lagi'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildItemList() {
    if (filteredItems.isEmpty) {
      return const Center(
        child: Text('Tidak ada data ditemukan', style: smMedium),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        final itemId = widget.getItemId?.call(item);
        final selectedId = widget.selectedItem != null
            ? widget.getItemId?.call(widget.selectedItem!)
            : null;
        final isSelected = itemId == selectedId;

        return InkWell(
          onTap: () {
            widget.onItemSelected(item);
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF2D3250) : Colors.transparent,
            ),
            child: Text(
              widget.getItemName(item),
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
