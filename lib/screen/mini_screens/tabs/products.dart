import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';

class ProductTabs {
  static Widget productTab({required List prodList}) {
    return prodList.isEmpty
        ? Center(
            child: Text(
              'Oh, parece que los productos... han desaparecido',
              style: WidgetTheme.appbarTitle,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: prodList.length,
              itemBuilder: (context, index) {
                var producto = prodList[index];
                var image = producto['foto'] == null
                    ? base64Decode(producto['foto'])
                    : null;
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Product',
                        arguments: prodList[index]);
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.fifth,
                        foregroundColor: AppTheme.white,
                        child: image == null
                            ? Text(producto['nombre'][0].toUpperCase())
                            : Image.memory(image),
                      ),
                      title: Text(producto['nombre']),
                      subtitle: Column(
                        children: [
                          Text(producto['descripcion']),
                          Text('\$${producto['precio']}')
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: AppTheme.fourth,
                        foregroundColor: Colors.white,
                        child: Text('${producto['precio']}'),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }

//------------------------------------------------------------------------------
  static Widget materialTab(
      {required List matList, required BuildContext context}) {
    return matList.isEmpty
        ? Center(
            child: Text(
              'No hay nada para mostrar',
              style: WidgetTheme.appbarTitle,
            ),
          )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: matList.length,
                  itemBuilder: (context, index) {
                    var item = matList[index];
                    return GestureDetector(
                      onTap: () {
                        print(matList[index]);
                        Navigator.pushNamed(context, '/MateriaPrima',
                            arguments: matList[index]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              item['Nombre'].toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.fifth,
                              ),
                            ),
                            trailing: Text(item['Codigo'].toUpperCase()),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/AddEditMatter',
                        arguments: {'isEdit': false});
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          );
  }
}
