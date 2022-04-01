import 'package:flutter/material.dart';

class LoadingProducts extends StatelessWidget {
  const LoadingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
