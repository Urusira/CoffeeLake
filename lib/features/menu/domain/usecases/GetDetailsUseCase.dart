import 'package:coffee_lake_app/features/menu/data/datasources/MenuRemoteDataSource.dart';
import 'package:coffee_lake_app/features/product/data/models/ProductData.dart';
import 'package:flutter/cupertino.dart';

class GetDetailsUseCase {
  MenuRemoteDataSource menuRemoteDataSource;

  GetDetailsUseCase(this.menuRemoteDataSource);

  Future<ProductData> call(int productId) {
    return menuRemoteDataSource.getProductById(productId);
  }
}