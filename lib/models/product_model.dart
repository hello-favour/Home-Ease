import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

    debugPrint("USER DATA ID:$data");

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

  // Optional: Add a method to convert to Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'price': price,
      'rating': rating,
    };
  }
}
