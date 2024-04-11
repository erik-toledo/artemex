import 'package:arte_mex/caracteristicas/comprador/comprar/domain/entities/compra.dart';

class CompradorCompraModel extends Compra {
  CompradorCompraModel({
    required String descripcionProducto,
    required String nombreEmpresa,
    required String nombreProducto,
    required String cantidad,
    required String precio,
    required String total,
    required String image,
    required String fechaCompra,
    required String estatusPago,
    required String estatusEntrega,
    required String ubicacion,
    required String tipoEnvio,
    required String idUsuario,
    required String idEmpresa,
  }) : super(
          descripcionProducto: descripcionProducto,
          nombreEmpresa: nombreEmpresa,
          nombreProducto: nombreProducto,
          cantidad: cantidad,
          precio: precio,
          total: total,
          image: image,
          fechaCompra: fechaCompra,
          estatusPago: estatusPago,
          estatusEntrega: estatusEntrega,
          ubicacion: ubicacion,
          tipoEnvio: tipoEnvio,
          idUsuario: idUsuario,
          idEmpresa: idEmpresa,
        );

  factory CompradorCompraModel.fromJson(Map<String, dynamic> compra) {
    return CompradorCompraModel(
      descripcionProducto: compra["descripcionProducto"],
      nombreEmpresa: compra["nombreEmpresa"],
      nombreProducto: compra["nombreProducto"],
      cantidad: compra["cantidad"].toString(),
      precio: compra["precio"].toString(),
      total: compra["total"].toString(),
      image: compra["image"],
      fechaCompra: compra["fechaCompra"],
      estatusPago: compra["estatusPago"],
      estatusEntrega: compra["estatus"],
      ubicacion: compra["ubicacion"],
      tipoEnvio: compra["empresaenvio"],
      idUsuario: compra["idUsuario"].toString(),
      idEmpresa: compra["idvendedor"].toString(),
    );
  }

  factory CompradorCompraModel.fromEntity(Compra compra) {
    return CompradorCompraModel(
      descripcionProducto: compra.descripcionProducto,
      nombreEmpresa: compra.nombreEmpresa,
      nombreProducto: compra.nombreProducto,
      cantidad: compra.cantidad,
      precio: compra.precio,
      total: compra.total,
      image: compra.image,
      fechaCompra: compra.fechaCompra,
      estatusPago: compra.estatusPago,
      estatusEntrega: compra.estatusEntrega,
      ubicacion: compra.ubicacion,
      tipoEnvio: compra.tipoEnvio,
      idUsuario: compra.idUsuario,
      idEmpresa: compra.idEmpresa,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "descripcionProducto": descripcionProducto,
      "nombreEmpresa": nombreEmpresa,
      "nombreProducto": nombreProducto,
      "cantidad": cantidad,
      "precio": precio,
      "total": total,
      "image": image,
      "fechaCompra": fechaCompra,
      "estatusPago": estatusPago,
      "estatusEntrega": estatusEntrega,
      "ubicacion": ubicacion,
      "tipoEnvio": tipoEnvio,
      "idUsuario": idUsuario,
      "idEmpresa": idEmpresa,
    };
  }
}
