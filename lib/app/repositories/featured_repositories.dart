import 'package:jwellery_app/app/api%20provider/featuredproductsapi_provider.dart';
import 'package:jwellery_app/model/featured_model.dart';

class FeaturedRepository {
  final FeaturedApiProvider apiProvider;

  FeaturedRepository({required this.apiProvider});
  Future<List<FeaturedModel>?> getFeaturedProducts() {
    return  apiProvider.getFeaturedProductsApi();
    

  }
}