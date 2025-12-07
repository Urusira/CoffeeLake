import 'package:coffee_lake_app/core/Network.dart';
import 'package:coffee_lake_app/features/menu/data/models/MenuData.dart';
import 'package:coffee_lake_app/features/product/data/models/ProductData.dart';

import '../../../../core/di.dart';

class MenuRemoteDataSource {
  Future<MenuData> getMenu() async {
    final response = await di<Network>().dio.get("/products");
    return MenuData.deserialize(response.data);
  }

  Future<ProductData> getProductById(int productId) async {
    final response = await di<Network>().dio.get("/products/$productId");
    return ProductData.deserialize(response.data);
  }
}
