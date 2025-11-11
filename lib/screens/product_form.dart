import 'package:flutter/material.dart';
import 'package:burhansporty/widgets/left_drawer.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Create Product Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // TODO: Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product Title",
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _title = v),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Title is required.";
                    return null;
                  },
                ),
              ),

              // Price (IDR)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "e.g., 150000",
                    labelText: "Price (IDR)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _price = int.tryParse(v) ?? 0),
                  validator: (v) {
                    final n = int.tryParse(v ?? "");
                    if (n == null || n < 0) return "Enter a valid non-negative price.";
                    return null;
                  },
                ),
              ),

              // Thumbnail URL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "https://...",
                    labelText: "Thumbnail URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _thumbnail = v),
                  validator: (v) {
                    if (v == null || v.isEmpty) return null; // optional
                    final ok = v.startsWith('http://') || v.startsWith('https://');
                    if (!ok) return "URL must start with http:// or https://";
                    return null;
                  },
                ),
              ),

              // Category (text)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "e.g., clothes, shoes, accessories",
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _category = v),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Category is required.";
                    return null;
                  },
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _description = v),
                ),
              ),

              // Sold
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "0",
                    labelText: "Sold",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _sold = int.tryParse(v) ?? 0),
                  validator: (v) {
                    final n = int.tryParse(v ?? "");
                    if (n == null || n < 0) return "Enter a valid non-negative number.";
                    return null;
                  },
                ),
              ),

              // Stock
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "0",
                    labelText: "Stock",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (v) => setState(() => _stock = int.tryParse(v) ?? 0),
                  validator: (v) {
                    final n = int.tryParse(v ?? "");
                    if (n == null || n < 0) return "Enter a valid non-negative number.";
                    return null;
                  },
                ),
              ),

              // Featured
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Featured"),
                  value: _isFeatured,
                  onChanged: (val) => setState(() => _isFeatured = val),
                ),
              ),

              // Save Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Capture current values so the dialog won’t be affected by later resets
                        final title = _title;
                        final price = _price;
                        final thumb = _thumbnail;
                        final category = _category;
                        final desc = _description;
                        final sold = _sold;
                        final stock = _stock;
                        final featured = _isFeatured;

                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Product saved'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title: $title'),
                                  Text('Price: $price'),
                                  Text('Thumbnail: ${thumb.isEmpty ? "-" : thumb}'),
                                  Text('Category: $category'),
                                  Text('Description: ${desc.isEmpty ? "-" : desc}'),
                                  Text('Sold: $sold'),
                                  Text('Stock: $stock'),
                                  Text('Featured: ${featured ? "Yes" : "No"}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );

                        _formKey.currentState!.reset();
                        if (!mounted) return;
                        setState(() {
                          _title = '';
                          _category = '';
                          _thumbnail = '';
                          _description = '';
                          _isFeatured = false;
                          _price = 0;
                          _sold = 0;
                          _stock = 0;
                        });
                      }
                    },
                    child: const Text(
                      "Save Product",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}