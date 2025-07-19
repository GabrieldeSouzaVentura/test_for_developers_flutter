import 'package:flutter_good_burger/good_burger/data/models/order_model.dart';

abstract class OrderRepository {
  Future<void> addOrder(OrderModel order);
}