
import 'package:jwellery_app/app/api%20provider/categoriesapi_provider.dart';
import 'package:jwellery_app/model/categoriestypes_model.dart';

class CategoriesRepository {
  final CategoriesApiProvider apiProvider;

  CategoriesRepository({required this.apiProvider});
  Future<List<Category>?> getCategoryTypes() {
    return  apiProvider.getCategoryTypesApi();
    

  }
}