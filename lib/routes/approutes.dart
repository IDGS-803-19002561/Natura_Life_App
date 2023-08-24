import 'package:flutter/material.dart';
import 'package:natura_life/screen.dart';
import 'package:natura_life/screen/add_edit_matter_screen.dart';
import 'package:natura_life/screen/add_edit_provider_screen.dart';
import 'package:natura_life/screen/materiaprima.dart';
import 'package:natura_life/screen/product_screen.dart';
import 'package:natura_life/screen/provider_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/Home': (BuildContext context) => const Home(),
    '/Login': (BuildContext context) => const Login(),
    '/Product': (BuildContext context) => const ProductScreen(),
    '/Provider': (BuildContext context) => const ProviderScreen(),
    '/MateriaPrima': (BuildContext context) => const MateriaPrimaScreen(),
    '/AddEditProvider': (BuildContext context) => const AddEditProviderScreen(),
    '/AddEditMatter': (BuildContext context) => const AddMateriaScreen(),
  };

  static const String initialROute = '/Login';

  static onUknownRoute(settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
