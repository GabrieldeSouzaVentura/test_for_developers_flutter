import 'package:flutter_good_burger/good_burger/domain/enums/order_item_type_enum.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';

class CalculeOrderTotalUseCase {
  CalculeOrderTotalUseCase();

  Future<double> call(List<ItemViewModel> items) async {
    final bool hasSandwich = items.any(
      (i) => i.itemType == OrderItemType.sandwich,
    );
    final bool hasFries = items.any((i) => i.itemType == OrderItemType.fries);
    final bool hasSoftDrink = items.any(
      (i) => i.itemType == OrderItemType.softDrink,
    );

    double totalPrice = 0.0;

    for (var item in items) {
      totalPrice += item.price;
    }

    if (hasFries && hasSoftDrink && hasSandwich) {
      totalPrice = totalPrice * 0.80;
    } else if (hasSoftDrink && hasSandwich) {
      totalPrice = totalPrice * 0.85;
    } else if (hasFries && hasSandwich) {
      totalPrice = totalPrice * 0.90;
    }

    return totalPrice;
  }
}
