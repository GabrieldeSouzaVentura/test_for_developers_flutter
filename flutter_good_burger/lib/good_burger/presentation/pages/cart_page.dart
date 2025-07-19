import 'package:flutter/material.dart';
import 'package:flutter_good_burger/core/dependency_injection/di.dart';
import 'package:flutter_good_burger/good_burger/presentation/store/cart_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartStore = getIt<CartStore>();

  @override
  void initState() {
    cartStore.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cartStore.buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Observer(
        builder: (_) => cartStore.order.items.isEmpty
            ? const Center(child: Text('Your cart is empty!'))
            : Column(
                children: [
                  Observer(
                    builder: (_) => Expanded(
                      child: ListView.builder(
                        itemCount: cartStore.order.items.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartStore.order.items[index];
                          return ListTile(
                            title: Text(cartItem.nameView),
                            subtitle: Text('Price: \$${cartItem.priceView}'),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  cartStore.removeItemFromCart(cartItem),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Total: \$${cartStore.order.totalViewModel}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: cartStore.nameController,
                          decoration: const InputDecoration(
                            labelText: "Enter your name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => cartStore.toPay(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.all(16),
                          ),
                          child: const Text(
                            'Pay',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
