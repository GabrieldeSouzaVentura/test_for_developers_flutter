import 'item_model.dart';

class OrderModel {
  final int? id;
  final List<ItemModel> items;
  final double total;

  OrderModel({required this.id, required this.items, required this.total});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      items: (json['extras'] as List)
          .map((e) => ItemModel.fromJson(e))
          .toList(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'items': items.map((e) => (e).toJson()).toList(),
    'total': total,
  };
}
