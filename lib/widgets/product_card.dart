import 'package:flutter/material.dart';
import 'package:burhansporty/screens/product_form.dart';
import 'package:burhansporty/screens/menu.dart';
import 'package:burhansporty/screens/product_entry_list.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  void _handleTap(BuildContext context) {
    if (item.name == "All Products") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductEntryListPage(
            onlyMine: false,
          ),
        ),
      );
    } else if (item.name == "My Products") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductEntryListPage(
            onlyMine: true,
          ),
        ),
      );
    } else if (item.name == "Create Product") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductFormPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _handleTap(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                item.color.withOpacity(0.95),
                item.color.withOpacity(0.8),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.18),
                  ),
                  child: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
