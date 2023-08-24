import 'package:flutter/material.dart';
import 'package:natura_life/models/materia_prima.dart';
import 'package:natura_life/theme/apptheme.dart';
import 'package:natura_life/theme/widget_styles.dart';
import 'package:natura_life/widget/reusable_widgets.dart';

class MateriaPrimaScreen extends StatelessWidget {
  const MateriaPrimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final materia =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    MateriaPrima materiaPrima = MateriaPrima.fromMap(materia);
    print(materiaPrima.nombre);

    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(
        title: 'Materia Prima',
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: AppTheme.fourth,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.shopping_bag,
                  size: 100,
                  color: AppTheme.white,
                ),
              ),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.info, // Icono para el Id
                  readOnly: true,
                  value: '${materiaPrima.idMateriaPrima}',
                  label: 'Id'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.qr_code, // Icono para el Código
                  value: materiaPrima.codigo,
                  label: 'Codigo'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.text_fields, // Icono para el Nombre
                  value: materiaPrima.nombre,
                  label: 'Nombre'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.description, // Icono para la Descripción
                  value: materiaPrima.descripcion,
                  label: 'Descripción'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.inventory, // Icono para el Stock
                  value: '${materiaPrima.stock}',
                  label: 'Total en Stock'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.low_priority, // Icono para la Cantidad Mínima
                  value: '${materiaPrima.cantMinima}',
                  label: 'Cantidad Mínima'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.expand_more, // Icono para la Cantidad Máxima
                  value: '${materiaPrima.cantMaxima}',
                  label: 'Cantidad Máxima'),
              const SizedBox(height: 20),
              ReusableWidgets.formInput(
                  icon: Icons.attach_money, // Icono para el Precio
                  value: '${materiaPrima.precio}',
                  label: 'Precio en MXN'),
              const SizedBox(height: 20),
              ReusableWidgets.filledColorButton(
                func: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Guardando proveedor...'),
                    ),
                  );
                },
                text: 'Editar Materia Prima',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ReusableWidgets.floatingActionButton(
        action: () {
          Navigator.of(context)
              .pushNamed('/AddEditMatter', arguments: materiaPrima.toMap());
        },
        icon: Icons.edit,
      ),
    );
  }
}
