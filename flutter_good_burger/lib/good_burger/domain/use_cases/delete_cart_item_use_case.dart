import 'package:flutter_good_burger/good_burger/domain/repositories/item_repository.dart';

class DeleteCartItemUseCase {
  final ItemRepository repository;

  DeleteCartItemUseCase(this.repository);

  Future<bool> call(int itemId) async {
    return await repository.deleteCartItems(itemId);
  }
}
