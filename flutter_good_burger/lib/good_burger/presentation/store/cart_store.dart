import 'package:flutter/material.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/add_order_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/calcule_order_total_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/clear_cart_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/delete_cart_item_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/presentation/pages/home_page.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/item_view_model.dart';
import 'package:flutter_good_burger/good_burger/presentation/view_model/order_view_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  final ClearCartItemsUseCase clearCartItemsUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;
  final CalculeOrderTotalUseCase calculeOrderTotalUseCase;
  final AddOrderUseCase addOrderUseCase;

  _CartStore(
    this.clearCartItemsUseCase,
    this.getCartItemsUseCase,
    this.deleteCartItemUseCase,
    this.calculeOrderTotalUseCase,
    this.addOrderUseCase,
  );

  @observable
  OrderViewModel order = OrderViewModel(null, ObservableList(), 0);

  @observable
  bool isLoading = false;

  bool isSaving = false;

  BuildContext? buildContext;

  final TextEditingController nameController = TextEditingController();

  @action
  Future<void> init() async {
    isLoading = true;
    try {
      final result = await getCartItemsUseCase();
      var totalPrice = await calculeOrderTotalUseCase(result);
      order = OrderViewModel(null, ObservableList.of(result), totalPrice);
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
  Future<void> removeItemFromCart(ItemViewModel item) async {
    if (isSaving) return;

    isSaving = true;

    try {
      final result = await deleteCartItemUseCase(item.id);
      if (result) {
        order.items.removeWhere((i) => i.id == item.id);
        var totalPrice = await calculeOrderTotalUseCase(order.items);
        order.total = totalPrice;

        ScaffoldMessenger.of(buildContext!).showSnackBar(
          SnackBar(
            content: Text('${item.nameView} removed from cart'),
            backgroundColor: Colors.red,
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
            content: const Text("Error trying to remove item!"),
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

  Future<void> toPay() async {
    if (nameController.text.trim().isEmpty) {
      showDialog(
        context: buildContext!,
        builder: (_) => AlertDialog(
          title: const Text("Validation Error"),
          content: const Text("Name cannot be empty."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(buildContext!),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }
    await showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text("Payment Successful"),
        content: Text(
          "The payment has been successfully completed, ${nameController.text}.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
    await addOrder();
    await clearCartItemsUseCase();
    Navigator.pushAndRemoveUntil(
      buildContext!,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (route) => false,
    );
  }

  @action
  Future<void> addOrder() async {
    try {
      var orderParams = AddeOrderParams(items: order.items, total: order.total);
      await addOrderUseCase(orderParams);
    } catch (e) {
      showDialog(
        context: buildContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!"),
            content: const Text("Error trying save order!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}