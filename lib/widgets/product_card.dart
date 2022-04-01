import 'package:flutter/material.dart';
import 'package:forms/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(rutaImg: product.imagen!),
            _ProductDetails(
              label: product.nombre,
              subLabel: product.id!,
            ),
            Positioned(
                top: 0,
                right: 0,
                child: _PriceTag(
                  price: product.precio.toString(),
                )),
            //TODO: Aparece con condicional
            if (!product.disponibilidad)
              Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable(disponible: product.disponibilidad),
              )
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 6),
              blurRadius: 10,
            )
          ]);
}

class _NotAvailable extends StatelessWidget {
  final bool disponible;
  const _NotAvailable({Key? key, required this.disponible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            disponible == true ? 'Disponible' : 'No disponible',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: disponible == true ? Colors.yellow[800] : Colors.red,
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final String price;
  const _PriceTag({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price',
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      width: 100,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String label;
  final String subLabel;
  const _ProductDetails({
    Key? key,
    required this.label,
    required this.subLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(subLabel,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), topRight: Radius.circular(20)),
      );
}

class _BackgroundImage extends StatelessWidget {
  final String rutaImg;
  const _BackgroundImage({
    Key? key,
    required this.rutaImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
          width: double.infinity,
          height: 400,
          child: FadeInImage(
            placeholder: const AssetImage('assets/cargar.gif'),
            image: NetworkImage(rutaImg),
            fit: BoxFit.cover,
          )),
    );
  }
}
