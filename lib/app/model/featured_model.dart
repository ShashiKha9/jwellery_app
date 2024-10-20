class FeaturedModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  bool isFavorite; 

  FeaturedModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isFavorite 
  });

  factory FeaturedModel.fromJson(Map<String, dynamic> json) {
    return FeaturedModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'], // Handle favorite status if available in JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
