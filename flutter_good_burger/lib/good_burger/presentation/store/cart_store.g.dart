// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  late final _$orderAtom = Atom(name: '_CartStore.order', context: context);

  @override
  OrderViewModel get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderViewModel value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_CartStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$initAsyncAction = AsyncAction(
    '_CartStore.init',
    context: context,
  );

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$removeItemFromCartAsyncAction = AsyncAction(
    '_CartStore.removeItemFromCart',
    context: context,
  );

  @override
  Future<void> removeItemFromCart(ItemViewModel item) {
    return _$removeItemFromCartAsyncAction.run(
      () => super.removeItemFromCart(item),
    );
  }

  @override
  String toString() {
    return '''
order: ${order},
isLoading: ${isLoading}
    ''';
  }
}
