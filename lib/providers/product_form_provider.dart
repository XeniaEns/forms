import 'package:flutter/material.dart';
import 'package:forms/models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  actualizarDisponibilidad(bool valor) {
    product.disponibilidad = valor;
    notifyListeners();
  }

  bool isValidForm() {
    print(product.nombre);
    print(product.precio);
    print(product.disponibilidad);
    return formKey.currentState?.validate() ?? false;
  }
}
