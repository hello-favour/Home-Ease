import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double price;
  final double rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.rating,
  });

  factory ProductsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Document data is null');
    }

    return ProductsModel(
      id: doc.id,
      title: data['title'] as String? ?? '',
      description: data['description'] as String? ?? '',
      imagePath: data['imagePath'] as String? ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      rating: (data['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'rating': rating,
    };
  }

  ProductsModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imagePath,
    double? price,
    double? rating,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }
}
