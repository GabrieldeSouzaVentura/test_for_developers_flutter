import 'package:flutter_good_burger/good_burger/data/models/item_model.dart';

abstract class ItemRepository {
  Future<List<ItemModel>> getAllItems();
  Future<List<ItemModel>> getCartItems();
  Future<bool> addItemToCart(ItemModel request);
  Future<bool> deleteCartItems(int itemId);
  Future<bool> clearCartItems();
}
