import '../../models/product/CartProductData.dart';
import 'order/OrderRepository.dart';

class CartRepository {
  static List<CartProductData> cartList = List.empty(growable: true);

  static List<CartProductData> getCart() {
    return cartList;
  }

  static List<double> getTotals() {
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

  static void doOrder() {
    OrderRepository.push();
    cartList = List.empty(growable: true);
  }

  static void add(CartProductData product) {
    CartProductData? inCartProduct = getByIdVol(product.id, product.vol);
    if (inCartProduct != null) {
      inCartProduct.count++;
    } else {
      cartList.add(product);
    }
  }

  static void remove(int productId, double vol) {
    CartProductData? inCartProduct = getByIdVol(productId, vol);

    if (inCartProduct != null && inCartProduct.count > 1) {
      inCartProduct.count--;
    } else {
      cartList.remove(getByIdVol(productId, vol));
    }
  }

  static int count(int id, double vol) {
    CartProductData? product = getByIdVol(id, vol);
    if (product != null) {
      return product.count;
    }
    return 0;
  }

  static CartProductData? getByIdVol(int id, double vol) {
    CartProductData? res;
    for (CartProductData it in cartList) {
      if (it.id == id && it.vol == vol) {
        res = it;
      }
    }
    return res;
  }

  static bool contains(int id, double vol) {
    bool res = false;
    for (CartProductData it in cartList) {
      if (it.id == id && it.vol == vol) {
        res = true;
        continue;
      }
    }
    return res;
  }
}
