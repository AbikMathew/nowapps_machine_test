import 'dart:developer';

import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';
import 'package:sqflite/sqflite.dart';

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
  List<Product> _productList = [];
  final _values = await _db.rawQuery('SELECT * FROM Cart');

  for (final _value in _values) {
    _productList.add(Product.fromMap(_value));
  }
  log('cart values ${_values}');
  return _productList;
}

addToCart(Product product, int index) async {
  final id = await _db.rawQuery('SELECT id FROM Cart WHERE id = ?', [index]);

  if (id.isNotEmpty) {
    //When product is already in the cart then update the quantity
    increseQty(index);
  } else {
    //Otherwise insert it into the cart
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
  getCartItems();
}

increseQty(int productID) async {
  await _db.rawUpdate(
      'UPDATE Cart SET quantity = quantity + 1 WHERE id = ?', [productID]);
  getCartItems();
}

decreaseQty({required int productID}) async {
  final qty =
      await _db.rawQuery('SELECT quantity FROM Cart WHERE id = ?', [productID]);

  if (qty.isNotEmpty) {
    var qtyAsString = qty[0]["quantity"].toString();
    var qtyAsInt = int.tryParse(qtyAsString);

    if (qtyAsInt! > 1) {
      //If quantity is greater than 1 then decrease the quantity
      await _db.rawUpdate(
          'UPDATE Cart SET quantity = quantity - 1 WHERE id = ?', [productID]);
    } else {
      removeFromCart(productID);
    }
  }
  getCartItems();
}

removeFromCart(int productID) async {
  await _db.rawDelete('DELETE FROM Cart WHERE id = ?', [productID]);
}
