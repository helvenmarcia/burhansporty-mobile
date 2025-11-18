// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String title;
    int price;
    String category;
    String thumbnail;
    String description;
    DateTime createdAt;
    bool isFeatured;
    dynamic seller;
    int stock;
    int sold;

    ProductEntry({
        required this.id,
        required this.title,
        required this.price,
        required this.category,
        required this.thumbnail,
        required this.description,
        required this.createdAt,
        required this.isFeatured,
        required this.seller,
        required this.stock,
        required this.sold,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        seller: json["seller"],
        stock: json["stock"],
        sold: json["sold"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "category": category,
        "thumbnail": thumbnail,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "seller": seller,
        "stock": stock,
        "sold": sold,
    };
}
