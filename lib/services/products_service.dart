import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forms/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  // Este notifier se gestiona a través del Provider
  final String _baseUrl = 'mercadito-flutter-default-rtdb.firebaseio.com';
  final List<Product> productos = [];
  late Product productoSeleccionado;

  bool isLoading = true;

  ProductsService() {
    cargarProductos();
  }

  Future cargarProductos() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final respuesta = await http.get(url);

    // Vamos a crear un mapa con la información que regresa
    final Map<String, dynamic> mapaDeProductos = json.decode(respuesta.body);
    mapaDeProductos.forEach((key, valor) {
      final productoTemporal = Product.fromMap(valor);
      productoTemporal.id = key;
      productos.add(productoTemporal);
    });

    isLoading = false;
    notifyListeners();
    return productos;
  }
}
