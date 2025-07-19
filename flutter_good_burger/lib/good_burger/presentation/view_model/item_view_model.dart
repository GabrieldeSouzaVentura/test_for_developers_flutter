import 'package:flutter_good_burger/good_burger/domain/enums/order_item_type_enum.dart';

class ItemViewModel {
  final int _id;
  final String _name;
  final double _price;
  final OrderItemType _itemType;

  const ItemViewModel(this._id, this._name, this._price, this._itemType);

  int get id => _id;
  double get price => _price;
  OrderItemType get itemType => _itemType;
  String get nameView => _name;
  String get priceView => _price.toStringAsFixed(2);
}
