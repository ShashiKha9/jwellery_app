import 'dart:convert';
import 'dart:io';

import 'dart:developer';

import 'package:jwellery_app/app/model/featured_model.dart';

class FeaturedApiProvider {

  Future<List<FeaturedModel>?> getFeaturedProductsApi() async {
    try{
       const  String response = '''{
    "categories": [
        {
            "id": 1,
            "name": "Necklaces",
            "description": "Beautiful and elegant necklaces for all occasions",
            "imageUrl": "https://example.com/images/necklaces.jpg",
             "isFavorite": false
        },
        {
            "id": 2,
            "name": "Earrings",
            "description": "Stylish earrings in various designs",
            "imageUrl": "https://example.com/images/earrings.jpg",
             "isFavorite": false
        },
        {
            "id": 3,
            "name": "Bracelets",
            "description": "Charming bracelets to complement your style",
            "imageUrl": "https://example.com/images/bracelets.jpg",
             "isFavorite": false
        },
        {
            "id": 4,
            "name": "Rings",
            "description": "Rings for engagements, weddings, and everyday wear",
            "imageUrl": "https://media.istockphoto.com/id/1331365346/photo/diamond-ring-in-jewelry-gift-box-close-up-background.jpg?s=1024x1024&w=is&k=20&c=bzwAu7duAE42rbNJSOxIrUj8ySaVsDSbNCUNK0mJgE0=",
             "isFavorite": false
        },
        {
            "id": 5,
            "name": "Anklets",
            "description": "Delicate anklets for a trendy look",
            "imageUrl": "https://example.com/images/anklets.jpg",
             "isFavorite": false
        },
        {
            "id": 6,
            "name": "Bangles",
            "description": "Traditional and modern bangles in various designs",
            "imageUrl": "https://example.com/images/bangles.jpg",
             "isFavorite": false
        },
        {
            "id": 7,
            "name": "Pendants",
            "description": "Unique pendants that make a statement",
            "imageUrl": "https://media.istockphoto.com/id/1203787084/photo/elegant-white-gold-necklace-with-diamonds.jpg?s=1024x1024&w=is&k=20&c=Ebj8gaEY8CKDrwew81O6xpuwjTHotfRvjNXdyHFlouA=",
             "isFavorite": false
        }
    ]
}''';

final Map<String,dynamic> data = json.decode(response);
final List<dynamic> featuredProducts = data['categories'];

log(featuredProducts.toString(),name: 'featured products Response Api');

final featured = featuredProducts.map((json)=> FeaturedModel.fromJson(json)).toList();

return featured;
 
    } on SocketException catch(e){

    log(e.toString(),name: 'error featured products Response');

    }
    return null;
  }
}