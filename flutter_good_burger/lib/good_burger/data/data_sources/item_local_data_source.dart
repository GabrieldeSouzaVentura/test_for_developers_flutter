import 'package:flutter_good_burger/core/data/local_data_base.dart';
import '../models/item_model.dart';

class ItemLocalDataSource {
  final List<ItemModel> _cartItems = [];

  Future<List<ItemModel>> getAllItems() async {
    final db = await LocalDataBase.database;
    final result = await db.query('items');
    return result.map((e) => ItemModel.fromJson((e))).toList();
  }

  Future<List<ItemModel>> getCartItems() async {
    return _cartItems;
  }

  Future<bool> addItemToCart(ItemModel newItem) async {
    _cartItems.add(newItem);
    return true;
  }

  Future<bool> deleteCartItems(int itemId) async {
    _cartItems.removeWhere((i) => i.id == itemId);
    return true;
  }

  Future<bool> clearCartItems() async {
    _cartItems.clear();
    return true;
  }
}
