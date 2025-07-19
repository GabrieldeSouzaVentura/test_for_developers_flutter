import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';
import 'package:mobx/mobx.dart';

class OrderViewModel {
  final int? orderId;
  ObservableList<ItemViewModel> items;
  double total;

  OrderViewModel(this.orderId, this.items, this.total);

  String get totalViewModel => total.toStringAsFixed(2);
}
