import 'package:flutter_good_burger/good_burger/data/models/item_model.dart';
import 'package:flutter_good_burger/good_burger/domain/repositories/item_repository.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';

class AddItemToCart {
  final ItemRepository repository;

  AddItemToCart(this.repository);

  Future<bool> call(ItemViewModel param) async {
    var itemModel = ItemModel(
      id: param.id,
      name: param.nameView,
      price: param.price,
      itemType: param.itemType.id,
    );

    return await repository.addItemToCart(itemModel);
  }
}
