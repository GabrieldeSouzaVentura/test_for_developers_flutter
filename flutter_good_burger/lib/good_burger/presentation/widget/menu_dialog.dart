import 'package:flutter/material.dart';
import 'package:flutter_good_burger/good_burger/presentation/pages/cart_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_good_burger/core/dependency_injection/di.dart';
import 'package:flutter_good_burger/good_burger/presentation/store/menu_dialog_store.dart';

class MenuDialog extends StatefulWidget {
  const MenuDialog({super.key});

  @override
  State<MenuDialog> createState() => _MenuDialogState();
}

class _MenuDialogState extends State<MenuDialog> {
  final menuDialogStore = getIt<MenuDialogStore>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await menuDialogStore.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    menuDialogStore.buildContext = context;

    return AlertDialog(
      title: const Text(
        'Available Products',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Burgers & Sandwiches',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Observer(
                builder: (_) => ListView.builder(
                  itemCount: menuDialogStore.burgersAndSandwiches.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = menuDialogStore.burgersAndSandwiches[index];
                    return ListTile(
                      title: Text(item.nameView),
                      subtitle: Text(item.priceView),
                      trailing: IconButton(
                        onPressed: () {
                          menuDialogStore.addItemToCart(
                            menuDialogStore.burgersAndSandwiches[index],
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Extras & Drinks',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Observer(
                builder: (_) => ListView.builder(
                  itemCount: menuDialogStore.extras.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = menuDialogStore.extras[index];
                    return ListTile(
                      title: Text(item.nameView),
                      subtitle: Text(item.priceView),
                      trailing: IconButton(
                        onPressed: () {
                          menuDialogStore.addItemToCart(
                            menuDialogStore.extras[index],
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          },
          child: const Text('Cart'),
        ),
      ],
    );
  }
}
