import 'package:flutter_good_burger/good_burger/data/data_sources/order_local_data_source.dart';
import '../../domain/repositories/order_repository.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource localDataSource;

  OrderRepositoryImpl(this.localDataSource);

  @override
  Future<void> addOrder(OrderModel order) async {
    return await localDataSource.addOrder(order);
  }
}
