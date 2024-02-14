import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    newTotal = entries[0].price * entries[0].quantity +
        entries[1].price * entries[1].quantity;

    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    Product value = entries.firstWhere((elemt) => elemt.id == id);
    value.quantity++;

    entries[value.id] = value;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    Product value = entries.firstWhere((elemt) => elemt.id == id);
    if (value.quantity != 0) {
      value.quantity--;
      entries[value.id] = value;
    }
    calcularTotal();
  }
}
