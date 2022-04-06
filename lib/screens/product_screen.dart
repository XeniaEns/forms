import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms/services/services.dart';
import 'package:forms/ui/input_decorations.dart';
import 'package:forms/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:forms/providers/product_form_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servicioProducto = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(servicioProducto.productoSeleccionado),
      child: _ProductScreenBody(servicioProducto: servicioProducto),
    );

    //return
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.servicioProducto,
  }) : super(key: key);

  final ProductsService servicioProducto;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(
                    rutaImg: servicioProducto.productoSeleccionado.imagen),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            const SizedBox(height: 40),
            const _FormularioProductos(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          //TODO: Guardar productos
          productForm.isValidForm();
        },
      ),
    );
  }
}

class _FormularioProductos extends StatelessWidget {
  const _FormularioProductos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final producto = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _buildFormBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: productForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: producto.disponibilidad,
                  initialValue: producto.nombre,
                  onChanged: (value) => producto.nombre = value,
                  validator: (valor) {
                    if (valor == null || valor.length < 1) {
                      return "El nombre es obligatorio";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    labelText: 'Producto',
                    hintText: 'nombre del producto',
                    prefixIcon: Icons.production_quantity_limits_outlined,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: producto.precio.toString(),
                  autocorrect: producto.disponibilidad,
                  onChanged: (valor) => {
                    if (double.tryParse(valor) == null)
                      {producto.precio = 0}
                    else
                      {producto.precio = double.parse(valor)}
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecorations.authInputDecoration(
                    labelText: 'Precio',
                    hintText: 'precio del producto',
                    prefixIcon: Icons.money,
                  ),
                ),
                const SizedBox(height: 30),
                SwitchListTile(
                  title: producto.disponibilidad == true
                      ? const Text('Disponible')
                      : const Text('No disponible'),
                  value: producto.disponibilidad,
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {
                    productForm.actualizarDisponibilidad(value);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildFormBoxDecoration() => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      );
}
