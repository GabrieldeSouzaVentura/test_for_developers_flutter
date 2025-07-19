import 'package:flutter_good_burger/good_burger/data/models/item_model.dart';
import 'package:flutter_good_burger/good_burger/data/models/order_model.dart';
import 'package:flutter_good_burger/good_burger/domain/repositories/order_repository.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';

class AddOrderUseCase {
  final OrderRepository repository;

  AddOrderUseCase(this.repository);

  Future<void> call(AddeOrderParams params) async {
    List<ItemModel> items = params.items.map((item) {
      return ItemModel(
        id: item.id,
        name: item.nameView,
        price: item.price,
        itemType: item.itemType.id,
      );
    }).toList();

    var order = OrderModel(id: null, items: items, total: params.total);
    return await repository.addOrder(order);
  }
}

class AddeOrderParams {
  final List<ItemViewModel> items;
  final double total;

  const AddeOrderParams({required this.items, required this.total});
}
