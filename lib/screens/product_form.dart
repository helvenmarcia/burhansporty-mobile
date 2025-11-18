import 'package:flutter/material.dart';
import 'package:burhansporty/widgets/left_drawer.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:burhansporty/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _category = '';
  String _thumbnail = '';
  String _description = '';
  bool _isFeatured = false;

  int _price = 0;
  int _sold = 0;
  int _stock = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      // Body
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Add Product',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Fill in the details for your new product.',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Basic info
                        Text(
                          'Basic Information',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Product Title',
                            labelText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (v) => setState(() => _title = v),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Title is required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            hintText: 'e.g., 150000',
                            labelText: 'Price (IDR)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (v) =>
                              setState(() => _price = int.tryParse(v) ?? 0),
                          validator: (v) {
                            final n = int.tryParse(v ?? '');
                            if (n == null || n < 0) {
                              return 'Enter a valid non-negative price.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'https://...',
                            labelText: 'Thumbnail URL',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (v) => setState(() => _thumbnail = v),
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return null;
                            }
                            final ok = v.startsWith('http://') ||
                                v.startsWith('https://');
                            if (!ok) {
                              return 'URL must start with http:// or https://';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'e.g., clothes, shoes, accessories',
                            labelText: 'Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (v) => setState(() => _category = v),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Category is required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Description',
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (v) => setState(() => _description = v),
                        ),

                        const SizedBox(height: 20),

                        // Inventory
                        Text(
                          'Inventory',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  hintText: '0',
                                  labelText: 'Sold',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (v) =>
                                    setState(() => _sold = int.tryParse(v) ?? 0),
                                validator: (v) {
                                  final n = int.tryParse(v ?? '');
                                  if (n == null || n < 0) {
                                    return 'Enter a valid non-negative number.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  hintText: '0',
                                  labelText: 'Stock',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (v) =>
                                    setState(() => _stock = int.tryParse(v) ?? 0),
                                validator: (v) {
                                  final n = int.tryParse(v ?? '');
                                  if (n == null || n < 0) {
                                    return 'Enter a valid non-negative number.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Visibility
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Featured product',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                              value: _isFeatured,
                              onChanged: (val) =>
                                  setState(() => _isFeatured = val),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Submit button
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final response = await request.postJson(
                                  "https://helven-marcia-burhansporty.pbp.cs.ui.ac.id/create-flutter/",
                                  jsonEncode({
                                    "title": _title,
                                    "price": _price,
                                    "description": _description,
                                    "thumbnail": _thumbnail,
                                    "category": _category,
                                    "is_featured": _isFeatured,
                                    "stock": _stock,
                                    "sold": _sold,
                                  }),
                                );

                                if (!context.mounted) return;

                                if (response['status'] == 'success') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Product successfully saved!'),
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Something went wrong, please try again.',
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Save Product'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
