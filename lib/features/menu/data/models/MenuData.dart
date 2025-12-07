import 'package:coffee_lake_app/features/product/data/models/ProductData.dart';

class MenuData {
  final List<ProductData> menuList;

  MenuData(this.menuList);

  factory MenuData.deserialize(Map<String, dynamic> json) {
    return MenuData(
      json
          .map((key, item) => MapEntry(key, ProductData.deserialize(item)))
          .values
          .toList(),
    );
  }
}
