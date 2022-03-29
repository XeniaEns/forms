// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.disponibilidad,
    this.imagen,
    required this.nombre,
    required this.precio,
  });

  bool disponibilidad;
  String? imagen;
  String nombre;
  double precio;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        disponibilidad: json["disponibilidad"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "disponibilidad": disponibilidad,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };
}
