import 'package:jwellery_app/app/screens/wishlist/wishlist_screen.dart';

class WishListModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  WishListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
