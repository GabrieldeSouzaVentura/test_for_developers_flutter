// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dialog_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuDialogStore on _MenuDialogStore, Store {
  late final _$itemListAtom = Atom(
    name: '_MenuDialogStore.itemList',
    context: context,
  );

  @override
  ObservableList<ItemViewModel> get itemList {
    _$itemListAtom.reportRead();
    return super.itemList;
  }

  @override
  set itemList(ObservableList<ItemViewModel> value) {
    _$itemListAtom.reportWrite(value, super.itemList, () {
      super.itemList = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MenuDialogStore.isLoading',
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

  late final _$burgersAndSandwichesAtom = Atom(
    name: '_MenuDialogStore.burgersAndSandwiches',
    context: context,
  );

  @override
  ObservableList<ItemViewModel> get burgersAndSandwiches {
    _$burgersAndSandwichesAtom.reportRead();
    return super.burgersAndSandwiches;
  }

  @override
  set burgersAndSandwiches(ObservableList<ItemViewModel> value) {
    _$burgersAndSandwichesAtom.reportWrite(
      value,
      super.burgersAndSandwiches,
      () {
        super.burgersAndSandwiches = value;
      },
    );
  }

  late final _$extrasAtom = Atom(
    name: '_MenuDialogStore.extras',
    context: context,
  );

  @override
  ObservableList<ItemViewModel> get extras {
    _$extrasAtom.reportRead();
    return super.extras;
  }

  @override
  set extras(ObservableList<ItemViewModel> value) {
    _$extrasAtom.reportWrite(value, super.extras, () {
      super.extras = value;
    });
  }

  late final _$initAsyncAction = AsyncAction(
    '_MenuDialogStore.init',
    context: context,
  );

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addItemToCartAsyncAction = AsyncAction(
    '_MenuDialogStore.addItemToCart',
    context: context,
  );

  @override
  Future<void> addItemToCart(ItemViewModel item) {
    return _$addItemToCartAsyncAction.run(() => super.addItemToCart(item));
  }

  late final _$_MenuDialogStoreActionController = ActionController(
    name: '_MenuDialogStore',
    context: context,
  );

  @override
  void setSandwichAndExtraList() {
    final _$actionInfo = _$_MenuDialogStoreActionController.startAction(
      name: '_MenuDialogStore.setSandwichAndExtraList',
    );
    try {
      return super.setSandwichAndExtraList();
    } finally {
      _$_MenuDialogStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemList: ${itemList},
isLoading: ${isLoading},
burgersAndSandwiches: ${burgersAndSandwiches},
extras: ${extras}
    ''';
  }
}
