import 'package:flutter_good_burger/core/data/local_data_base.dart';
import '../models/order_model.dart';

class OrderLocalDataSource {
  Future<void> addOrder(OrderModel order) async {
    final db = await LocalDataBase.database; 
    final id = await db.insert('orders', {
      'total': order.total,
    });

    for (var item in order.items){
      await db.insert('order_items', {
        'itemId': item.id,
        'orderId':  id,
      });
    }
  }
}