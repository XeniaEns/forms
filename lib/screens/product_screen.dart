import 'package:flutter/material.dart';
import 'package:forms/ui/input_decorations.dart';
import 'package:forms/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
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
        child: Icon(Icons.save),
        onPressed: () {
          //TODO: Guardar productos
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
    return Container(
      width: double.infinity,
      decoration: _buildFormBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  labelText: 'Producto',
                  hintText: 'Nombre del producto',
                  prefixIcon: Icons.production_quantity_limits_outlined,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  labelText: 'Precio',
                  hintText: 'Precio del producto',
                  prefixIcon: Icons.money,
                ),
              ),
              SizedBox(height: 30),
              SwitchListTile(
                title: const Text('Disponible'),
                value: true,
                activeColor: Colors.blueGrey,
                onChanged: (value) {},
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildFormBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      );
}
