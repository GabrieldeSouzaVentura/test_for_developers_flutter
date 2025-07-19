import 'package:flutter_good_burger/good_burger/data/data_sources/item_local_data_source.dart';
import 'package:flutter_good_burger/good_burger/data/models/item_model.dart';
import '../../domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl(this.localDataSource);

  @override
  Future<List<ItemModel>> getAllItems() async {
    return await localDataSource.getAllItems();
  }

  @override
  Future<bool> clearCartItems() async {
    return await localDataSource.clearCartItems();
  }

  @override
  Future<bool> deleteCartItems(int itemId) async {
    return await localDataSource.deleteCartItems(itemId);
  }

  @override
  Future<List<ItemModel>> getCartItems() async {
    return await localDataSource.getCartItems();
  }

  @override
  Future<bool> addItemToCart(ItemModel request) async {
    return await localDataSource.addItemToCart(request);
  }
}
