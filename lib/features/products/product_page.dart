import 'package:flutter/material.dart';
import 'package:mini_project_flutter/features/products/product_provider.dart';
import 'package:provider/provider.dart';

import '../../app_routes.dart';
import '../auth/auth_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final product = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(
          title: Text('Welcome, ${auth.username}'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthProvider>().logout();
                Navigator.pushReplacementNamed(context, AppRoute.login);
              },
              icon: const Icon(Icons.logout),
            )
          ]),
      body: Builder(builder: (_) {
        if (product.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (product.error.isNotEmpty) {
          return Center(child: Text(product.error));
        }
        if (product.products.isEmpty) {
          return ElevatedButton(
              onPressed: () {
                context.read<ProductProvider>().loadProducts();
              },
              child: const Text('Load Products'));
        }
        return ListView.builder(
            itemCount: product.products.length,
            itemBuilder: (_, index) {
              return  ListTile(
                title: Text(product.products[index]),
              );
            });
      }),
    );
  }
}
