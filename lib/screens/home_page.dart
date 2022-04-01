import 'package:flutter/material.dart';
import 'package:forms/screens/loading_products.dart';
import 'package:forms/services/services.dart';
import 'package:forms/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servicioProductos = Provider.of<ProductsService>(context);

    if (servicioProductos.isLoading) return const LoadingProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
          itemCount: servicioProductos.productos.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'product'),
              child: ProductCard(product: servicioProductos.productos[index]))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
