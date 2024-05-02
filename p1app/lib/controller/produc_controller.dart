import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductCotroller extends GetxController {
  var isLoading = false.obs;
  var _dio = Dio();
  RxList products = [].obs;
  RxList categories = [].obs;
  RxList allCategories = [].obs;
  RxList categoryProduct = [].obs;
  RxList productsByCategory = [].obs;
  // List<Map<String, dynamic>> filteredMaps =  maps.where((map) => map[key] == value).toList();

  Future<void> fetchProductsData() async {
    try {
      isLoading(true);
      var response = await _dio.get('https://dummyjson.com/products');
      products.value = response.data['products'];

      categories.value =
          products.map((element) => element['category']).toList();
      allCategories.value = categories.toSet().toList();

      productsByCategory.value =
          products.where((e) => e['category'] == 'fragrances').toList();
      print('${response.data}');
      print(
          "===========productByCategorie===============> $productsByCategory");
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }

  getProductByCategories({required String category}){
    return 
      productsByCategory.value =
        products.where((e) => e['category'] == category).toList();
  }
}
