import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/providers/login_provider.dart';
import 'package:natura_life/providers/util_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APiProvider extends ChangeNotifier {
  final String _urlBase = 'http://192.168.113.138:7092/api';

  List<dynamic> products = [];
  List<dynamic> matter = [];
  List<dynamic> provider = [];

  APiProvider() {
    getMatter();
  }

  Future login({required LoginFormProvider lfp}) async {
    final prefs = await SharedPreferences.getInstance();
    final String url = '$_urlBase/Auth/login';
    final response = await UtilProvider.rtp.bodyHTTP(urlBase: url, lfp: lfp);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as Map;
      prefs.setString('IdUsuario', '${jResponse['id']}');
      var usuario = jResponse['usuario'] as Map;
      var rol = usuario['roles'] as List<dynamic>;
      prefs.setString('CorreoUsuario', usuario['correo']);
      prefs.setString('RolUsuario', rol[0]['nombre']);
      prefs.setString('NombreUsuario', usuario['nombre']);
      prefs.setString('ApellidosUsuario', usuario['apellido']);
      // prefs.setString('CorreoUsuario', jResponse['correo']);
      // prefs.setString('RolUsuario', jResponse['nombreRol']);
      // prefs.setString('NombreUsuario', jResponse['nombre']);
      // prefs.setString('ApellidosUsuario', jResponse['apellidos']);
      // prefs.setString('TelefonoUsuario', jResponse['telefono']);
      // prefs.setString('DireccionUsuario', jResponse['direccion']);
      prefs.setString('Token', jResponse['token']);
      return 'OK';
    }
    notifyListeners();
    return response.body;
  }

  Future getProducts() async {
    final String url = '$_urlBase/Productos';
    final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      products = jResponse;
      notifyListeners();
    }
  }

  Future getMatter() async {
    // final String url = '$_urlBase/MateriaPrimas';
    const String url = 'http://localhost/api/MateriasPrimas.php';
    final response = await UtilProvider.rtp.apiRest(urlBase: url);
    // final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      matter = jResponse;
      notifyListeners();
    }
  }

  // Future getProviders() async {
  //   final String url = '$_urlBase/Proveedores';
  //   final response = await UtilProvider.rtp.responseHTTP(urlBase: url);
  //   if (response.statusCode == 200) {
  //     var jResponse = jsonDecode(response.body) as List<dynamic>;
  //     provider = jResponse;
  //     notifyListeners();
  //   }
  // }

  Future deleteProduct(int id) async {
    final String url = '$_urlBase/Productos/$id';
    final response = await UtilProvider.rtp.deleteHTTP(id: id, urlBase: url);
    if (response.statusCode == 200) {
      return 'OK';
    } else {
      return 'ERROR';
    }
  }
}
