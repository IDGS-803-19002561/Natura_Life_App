import 'dart:convert';

class MateriaPrima {
  final int idMateriaPrima;
  final String codigo;
  final String nombre;
  final String descripcion;
  final int perecedero;
  final int stock;
  final int cantMinima;
  final int cantMaxima;
  final int idUnidadMedida;
  final double precio;
  final String foto;
  final int idProveedor;
  final int idStatus;
  final String fechaRegistro;
  final String fechaModificacion;

  MateriaPrima({
    required this.idMateriaPrima,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.perecedero,
    required this.stock,
    required this.cantMinima,
    required this.cantMaxima,
    required this.idUnidadMedida,
    required this.precio,
    required this.foto,
    required this.idProveedor,
    required this.idStatus,
    required this.fechaRegistro,
    required this.fechaModificacion,
  });

  factory MateriaPrima.fromJson(String str) =>
      MateriaPrima.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MateriaPrima.fromMap(Map<String, dynamic> json) => MateriaPrima(
        idMateriaPrima: json['IdMateriaPrima'],
        codigo: json['Codigo'],
        nombre: json['Nombre'],
        descripcion: json['Descripcion'],
        perecedero: json['Perecedero'],
        stock: json['Stock'],
        cantMinima: json['CantMinima'],
        cantMaxima: json['CantMaxima'],
        idUnidadMedida: json['IdUnidadMedida'],
        precio: double.parse(json['Precio']),
        foto: json['Foto'],
        idProveedor: json['IdProveedor'],
        idStatus: json['IdStatus'],
        fechaRegistro: json['FechaRegistro'],
        fechaModificacion: json['FechaModificacion'],
      );

  Map<String, dynamic> toMap() => {
        'IdMateriaPrima': idMateriaPrima,
        'Codigo': codigo,
        'Nombre': nombre,
        'Descripcion': descripcion,
        'Perecedero': perecedero,
        'Stock': stock,
        'CantMinima': cantMinima,
        'CantMaxima': cantMaxima,
        'IdUnidadMedida': idUnidadMedida,
        'Precio': precio.toString(),
        'Foto': foto,
        'IdProveedor': idProveedor,
        'IdStatus': idStatus,
        'FechaRegistro': fechaRegistro,
        'FechaModificacion': fechaModificacion,
      };
}
