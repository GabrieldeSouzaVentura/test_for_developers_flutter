class ItemModel {
  final int id;
  final String name;
  final double price;
  final int itemType;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.itemType,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      itemType: json['itemType'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'itemType': itemType,
    'name': name,
    'price': price,
  };
}
