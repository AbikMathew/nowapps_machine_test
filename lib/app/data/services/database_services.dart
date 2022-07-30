import 'dart:developer';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/cart/controllers/cart_controller.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/cart/controllers/cart_controller.dart';

final cartController = Get.find<CartController>();
late Database _db;

openDB() async {
  _db = await openDatabase(
    'nowapps_cart.db',
    version: 1,
    onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE Cart(id INT, name TEXT, price TEXT, quantity TEXT, image TEXT)");
    },
  );
}

Future<List<Product>> getCartItems() async {
  List<Product> productList = [];
  final values = await _db.rawQuery('SELECT * FROM Cart');

  //convert map to product object, and add to productList
  for (final value in values) {
    productList.add(
      Product.fromMap(value),
    );
  }
  log('cart values $values');
  return productList;
}

addToCart(Product product, int index) async {
  final id = await _db.rawQuery('SELECT id FROM Cart WHERE id = ?', [index]);

  if (id.isNotEmpty) {
    //When a product is already added to the cart then update the quantity
    increseQty(index);
  } else {
    //Otherwise insert the product into the cart (new entry)
    await _db.rawInsert(
        'INSERT INTO Cart(id, name, price, quantity, image) VALUES(?, ?, ?, ?, ?)',
        [
          product.id,
          product.name,
          product.price,
          product.quantity,
          product.image
        ]);
  }
}

increseQty(int productID) async {
  //increase quantity of a product in the cart
  await _db.rawUpdate(
      'UPDATE Cart SET quantity = quantity + 1 WHERE id = ?', [productID]);
}

decreaseQty({required int productID}) async {
  //decrease quantity of a product in the cart
  final qty =
      await _db.rawQuery('SELECT quantity FROM Cart WHERE id = ?', [productID]);

  if (qty.isNotEmpty) {
    var qtyAsString = qty[0]["quantity"].toString();
    var qtyAsInt = int.tryParse(qtyAsString);

    if (qtyAsInt! > 1) {
      //If quantity is greater than 1 then decrease the quantity
      await _db.rawUpdate(
          'UPDATE Cart SET quantity = quantity - 1 WHERE id = ?', [productID]);
      log('inCartIDs ${cartController.inCartIDs}');
    } else {
      //If quantity is 1 then delete the product from the cart
      removeFromCart(productID);
    }
  }
}

removeFromCart(int productID) async {
  await _db.rawDelete('DELETE FROM Cart WHERE id = ?', [productID]);
  cartController.inCartIDs.removeWhere((element) => element == productID);
  log('inCartIDs ${cartController.inCartIDs}');
}

deleteCart() async {
  cartController.inCartIDs.clear();
  await _db.delete('Cart');
}
