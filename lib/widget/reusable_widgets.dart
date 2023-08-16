import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';

import '../theme/widget_styles.dart';

class ReusableWidgets {
  //Use esta cosa para el form del login, pero probablemente lo use para notificaciones personalizadas
  static Card cardContainer({
    required Widget content,
    BorderRadius? radius,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: radius ?? BorderRadius.circular(30.0)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: content,
      ),
    );
  }

  static TextFormField loginInput(
      {required IconData icon,
      required String label,
      required void Function(String) onchange,
      bool obscure = false}) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.text,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppTheme.primary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppTheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppTheme.fifth),
        ),
        prefixIcon: Icon(
          icon,
          color: AppTheme.fourth,
        ),
      ),
      onChanged: onchange,
      validator: (value) {
        return (value != null && value.length >= 3) ? null : 'Tu usuario debe';
      },
    );
  }

  static ElevatedButton filledColorButton({
    required VoidCallback func,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.all(15.0),
        backgroundColor: AppTheme.primary,
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18.0), // Aumenta el tamaño de la fuente de letra
      ),
    );
  }

  static ElevatedButton borderColorButton({
    required VoidCallback func,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
              color: AppTheme.primary), // Establece el color del contorno
        ),
        padding: const EdgeInsets.all(20.0),
        backgroundColor: Colors.white, // Establece el color de fondo a blanco
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0, // Aumenta el tamaño de la fuente de letra
          color: AppTheme
              .primary, // Establece el color del texto al color primario
        ),
      ),
    );
  }

  static IconButton bottomButton(
      {required IconData icon, required VoidCallback action}) {
    return IconButton(
      icon: Icon(
        icon,
        color: AppTheme.fourth,
        size: 40,
      ),
      onPressed: action,
    );
  }

  static AppBar generalAppBar({required String title}) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: WidgetTheme.appbarTitle,
      ),
    );
  }

  static Expanded divider() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        color: AppTheme.fifth,
      ),
    ));
  }

  static Row dividerWithText({required String heading}) {
    return Row(
      children: [
        Text(
          heading,
          style: WidgetTheme.mediumTex,
        ),
        divider(),
      ],
    );
  }

  static Padding userData({required String data, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data,
            style: WidgetTheme.shortText,
          ),
          Icon(
            icon,
            color: AppTheme.fourth,
          )
        ],
      ),
    );
  }
}
