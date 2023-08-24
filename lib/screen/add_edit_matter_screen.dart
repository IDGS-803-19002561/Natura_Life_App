import 'package:flutter/material.dart';
import 'package:natura_life/providers/materias_primas_provider.dart';
import 'package:natura_life/widget/reusable_widgets.dart';
import 'package:provider/provider.dart';
import 'package:natura_life/theme/apptheme.dart';

class AddMateriaScreen extends StatefulWidget {
  const AddMateriaScreen({super.key});

  @override
  State<AddMateriaScreen> createState() => _AddMateriaScreenState();
}

class _AddMateriaScreenState extends State<AddMateriaScreen> {
  final _providerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _saveForm() {
    final isValid = _providerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _providerFormKey.currentState!.save();
    // Provider.of<MateriasPrimasProvider>(context, listen: false).addMateriaPrima();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.generalAppBar(
          title: 'Agregar Materia Prima', hasLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _providerFormKey,
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
                    Icons.person,
                    size: 100,
                    color: AppTheme.white,
                  ),
                ),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(icon: Icons.qr_code, label: 'Codigo'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.text_fields, label: 'Nombre'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.description, label: 'Descripción'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.inventory, label: 'Total en Stock'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.expand_less, label: 'Cantidad Mínima'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.expand_more, label: 'Cantidad Máxima'),
                const SizedBox(height: 20),
                ReusableWidgets.formInput(
                    icon: Icons.attach_money, label: 'Precio en MXN'),
                const SizedBox(height: 20),
                ReusableWidgets.filledColorButton(
                  func: _saveForm,
                  text: 'Guardar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
