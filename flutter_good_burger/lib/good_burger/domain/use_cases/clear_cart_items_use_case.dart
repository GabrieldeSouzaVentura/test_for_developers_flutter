import 'package:flutter_good_burger/good_burger/domain/repositories/item_repository.dart';

class ClearCartItemsUseCase {
  final ItemRepository repository;

  ClearCartItemsUseCase(this.repository);

  Future<bool> call() async {
    return await repository.clearCartItems();
  }
}
