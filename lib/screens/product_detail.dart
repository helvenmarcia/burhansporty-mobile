import 'package:flutter/material.dart';
import 'package:burhansporty/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}, '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }

  String _formatPrice(int price) {
    final digits = price.toString();
    final buffer = StringBuffer();
    int count = 0;

    for (int i = digits.length - 1; i >= 0; i--) {
      buffer.write(digits[i]);
      count++;
      if (count == 3 && i != 0) {
        buffer.write('.');
        count = 0;
      }
    }

    final reversed = buffer.toString().split('').reversed.join('');
    return 'Rp $reversed';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOutOfStock = product.stock <= 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[100],
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Hero image
                _buildHeroImage(context),

                // Body
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          _buildHeader(theme),

                          const SizedBox(height: 12),

                          // Pills
                          _buildPills(theme),

                          const SizedBox(height: 16),

                          // Price
                          Text(
                            _formatPrice(product.price),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isOutOfStock
                                ? 'Currently unavailable'
                                : 'In stock • Ready to ship',
                            style: TextStyle(
                              fontSize: 13,
                              color: isOutOfStock
                                  ? Colors.red[700]
                                  : Colors.grey[700],
                            ),
                          ),

                          const SizedBox(height: 20),
                          const Divider(height: 1),
                          const SizedBox(height: 16),

                          // Description
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.description.isNotEmpty
                                ? product.description
                                : 'No description provided.',
                            style: const TextStyle(
                              fontSize: 15,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          const SizedBox(height: 24),

                          // Action button
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: isOutOfStock ? null : () {},
                              style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: Text(
                                isOutOfStock ? 'Out of Stock' : 'Buy Now',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroImage(BuildContext context) {
    final image = product.thumbnail.isNotEmpty
        ? Image.network(
            'https://helven-marcia-burhansporty.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 260,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.broken_image, size: 50),
              ),
            ),
          )
        : Container(
            height: 260,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.image_not_supported, size: 50),
            ),
          );

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: image,
        ),
        if (product.isFeatured)
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 14, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    'FEATURED',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          _formatDate(product.createdAt),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildPills(ThemeData theme) {
    final pills = <Widget>[];

    pills.add(
      _pill(
        label: product.category.toUpperCase(),
        icon: Icons.category_outlined,
        background: theme.colorScheme.primary.withOpacity(0.08),
        foreground: theme.colorScheme.primary,
      ),
    );

    if (product.seller != null && product.seller.toString().isNotEmpty) {
      pills.add(
        _pill(
          label: 'Seller: ${product.seller}',
          icon: Icons.person_rounded,
          background: Colors.indigo.withOpacity(0.06),
          foreground: Colors.indigo[800] ?? Colors.indigo,
        ),
      );
    }

    pills.add(
      _pill(
        label: 'Stock: ${product.stock}',
        icon: Icons.inventory_2_outlined,
        background: Colors.green.withOpacity(0.06),
        foreground: Colors.green[800] ?? Colors.green,
      ),
    );

    pills.add(
      _pill(
        label: 'Sold: ${product.sold}',
        icon: Icons.local_fire_department_outlined,
        background: Colors.orange.withOpacity(0.06),
        foreground: Colors.orange[800] ?? Colors.orange,
      ),
    );

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: pills,
    );
  }

  Widget _pill({
    required String label,
    required IconData icon,
    required Color background,
    required Color foreground,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: foreground),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }
}
