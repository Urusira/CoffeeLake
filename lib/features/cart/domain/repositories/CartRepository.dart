import 'package:coffee_lake_app/features/cart/data/datasources/CartLocalDataSource.dart';

import '../../../product/data/models/CartProductData.dart';
import 'OrderRepository.dart';

class CartRepository {

  CartLocalDataSource cartLocalDataSource;

  CartRepository(this.cartLocalDataSource);

  Future<List<CartProductData>> getCart() {
    return cartLocalDataSource.getCart();
  }

  Future<List<double>> getTotals() async {
    List<CartProductData> cartList = await cartLocalDataSource.getCart();
    List<double> res = List.empty(growable: true);
    double baseTotal = 0;
    double fullTotal = 0;

    for (CartProductData it in cartList) {
      baseTotal += it.price * it.count;
      fullTotal += (it.price - (it.price * (it.sale / 100))) * it.count;
    }

    res.addAll([baseTotal, fullTotal]);
    return List.unmodifiable(res);
  }

  Future<void> doOrder() async {
    OrderRepository.push();
    cartLocalDataSource.clearAll();
  }

  Future<void> add(CartProductData product) async {
    cartLocalDataSource.addToCart(product);
  }

  Future<void> remove(CartProductData product) async {
    cartLocalDataSource.removeFromCart(product);
  }

  Future<int> count(int id, double vol) async {
    CartProductData? product = await cartLocalDataSource.getProduct(id, vol);
    if (product != null) {
      return product.count;
    }
    return 0;
  }

  Future<CartProductData?> getByIdVol(int productId, double productVol) async {
    return await cartLocalDataSource.getProduct(productId, productVol);
  }

  Future<bool> contains(int productId, double productVol) async {
    return await getByIdVol(productId, productVol) != null;
  }
}
