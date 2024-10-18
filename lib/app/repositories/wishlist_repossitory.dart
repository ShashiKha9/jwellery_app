import 'package:jwellery_app/app/api%20provider/wishlistapi_provider.dart';
import 'package:jwellery_app/model/wishlist_model.dart';

class WishlistRepository {
  final WishlistApiProvider apiProvider;

  WishlistRepository({required this.apiProvider});
  Future<List<WishListModel>?> getWishlistProducts() {
    return  apiProvider.getWishlistProductsApi();
    

  }
}