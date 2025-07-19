import 'package:flutter_good_burger/good_burger/domain/enums/order_item_type_enum.dart';
import 'package:flutter_good_burger/good_burger/domain/repositories/item_repository.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';

class GetCartItemsUseCase {
  final ItemRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<List<ItemViewModel>> call() async {
    var result = await repository.getCartItems();
    List<ItemViewModel> viewModelList = [];

    for (var item in result) {
      var viewModel = ItemViewModel(
        item.id,
        item.name,
        item.price,
        OrderItemType.values.firstWhere((e) => e.id == item.itemType),
      );

      viewModelList.add(viewModel);
    }

    return viewModelList;
  }
}
