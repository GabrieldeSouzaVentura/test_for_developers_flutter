import 'package:flutter_good_burger/good_burger/data/data_sources/item_local_data_source.dart';
import 'package:flutter_good_burger/good_burger/data/data_sources/order_local_data_source.dart';
import 'package:flutter_good_burger/good_burger/data/repositories/items_repository_impl.dart';
import 'package:flutter_good_burger/good_burger/data/repositories/order_repository_impl.dart';
import 'package:flutter_good_burger/good_burger/domain/repositories/item_repository.dart';
import 'package:flutter_good_burger/good_burger/domain/repositories/order_repository.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/add_item_to_cart_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/add_order_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/calcule_order_total_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/clear_cart_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/delete_cart_item_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/get_all_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flutter_good_burger/good_burger/presentation/store/cart_store.dart';
import 'package:flutter_good_burger/good_burger/presentation/store/menu_dialog_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => ItemLocalDataSource());
  getIt.registerLazySingleton(() => OrderLocalDataSource());

  getIt.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton(() => GetAllItemUseCase(getIt()));
  getIt.registerLazySingleton(() => AddItemToCart(getIt()));
  getIt.registerLazySingleton(() => AddOrderUseCase(getIt()));
  getIt.registerLazySingleton(() => CalculeOrderTotalUseCase());
  getIt.registerLazySingleton(() => ClearCartItemsUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteCartItemUseCase(getIt()));
  getIt.registerLazySingleton(() => GetCartItemsUseCase(getIt()));

  getIt.registerFactory(() => MenuDialogStore(getIt(), getIt(), getIt()));
  getIt.registerFactory(
    () => CartStore(getIt(), getIt(), getIt(), getIt(), getIt()),
  );
}
