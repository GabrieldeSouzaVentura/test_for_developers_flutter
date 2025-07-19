import 'package:flutter/material.dart';
import 'package:flutter_good_burger/good_burger/domain/enums/order_item_type_enum.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/add_item_to_cart_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/get_all_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';
import 'package:mobx/mobx.dart';

part 'menu_dialog_store.g.dart';

class MenuDialogStore = _MenuDialogStore with _$MenuDialogStore;

abstract class _MenuDialogStore with Store {
  final GetAllItemUseCase getAllItemsUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddItemToCart addItemToCartUseCase;

  _MenuDialogStore(
    this.getAllItemsUseCase,
    this.addItemToCartUseCase,
    this.getCartItemsUseCase,
  );

  @observable
  ObservableList<ItemViewModel> itemList = ObservableList();

  @observable
  bool isLoading = false;

  bool isSaving = false;

  @observable
  ObservableList<ItemViewModel> burgersAndSandwiches = ObservableList();

  @observable
  ObservableList<ItemViewModel> extras = ObservableList();

  List<ItemViewModel> _cartItems = [];
  
  BuildContext? buildContext;

  @action
  Future<void> init() async {
    isLoading = true;
    try {
      final result = await getAllItemsUseCase();
      itemList = ObservableList.of(result);
      setSandwichAndExtraList();
      _cartItems = await getCartItemsUseCase();
    } catch (e) {
      showDialog(
        context: buildContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!"),
            content: const Text("Error trying to get items!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } finally {
      isLoading = false;
    }
  }

  @action
  void setSandwichAndExtraList() {
    burgersAndSandwiches = ObservableList.of(
      itemList.where((item) => item.itemType == OrderItemType.sandwich),
    );

    extras = ObservableList.of(
      itemList.where((item) => item.itemType != OrderItemType.sandwich),
    );
  }

  @action
  Future<void> addItemToCart(ItemViewModel item) async {
    if (isSaving) return;

    isSaving = true;

    try {
      final alreadyExists = _cartItems.any((i) => i.itemType == item.itemType);
      if (alreadyExists) {
        ScaffoldMessenger.of(buildContext!).showSnackBar(
          const SnackBar(
            content: Text('Item of this type already added'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }

      final result = await addItemToCartUseCase(item);
      if (result) {
        _cartItems.add(item);
        ScaffoldMessenger.of(buildContext!).showSnackBar(
          const SnackBar(
            content: Text('Succesfull'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(buildContext!).showSnackBar(
          const SnackBar(
            content: Text('Unexpected error'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: buildContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!"),
            content: const Text("Error add item to cart!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } finally {
      isSaving = false;
    }
  }
}
