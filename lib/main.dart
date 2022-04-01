import 'package:flutter/material.dart';
import 'package:forms/screens/screens.dart';
import 'package:provider/provider.dart';
import 'services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Los providers gestionan los servicios
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsService(),
        ),
      ],
      child: const MyForms(),
    );
  }
}

class MyForms extends StatelessWidget {
  const MyForms({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomePage(),
        'product': (_) => const ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.blueGrey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
        ),
      ),
    );
  }
}
