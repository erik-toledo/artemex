import 'package:arte_mex/caracteristicas/comprador/historial/domain/entities/comprador_historial_compra.dart';

class CompradorHistorialCompraModel extends CompradorHistorialCompra {
  CompradorHistorialCompraModel({
    required String nombreEmpresa,
    required String nombreProducto,
    required String cantidad,
    required String descripcionProducto,
    required String precio,
    required String total,
    required String fechaCompra,
    required String estatusPago,
    required String estatusEntrega,
    required String ubicacion,
    required String tipoEnvio,
    required String idUsuario,
    required String idEmpresa,
    required String image,
    required String idCompra,
  }) : super(
          idCompra: idCompra,
          nombreEmpresa: nombreEmpresa,
          nombreProducto: nombreProducto,
          cantidad: cantidad,
          descripcionProducto: descripcionProducto,
          precio: precio,
          total: total,
          fechaCompra: fechaCompra,
          estatusPago: estatusPago,
          estatusEntrega: estatusEntrega,
          ubicacion: ubicacion,
          tipoEnvio: tipoEnvio,
          idUsuario: idUsuario,
          idEmpresa: idEmpresa,
          image: image,
        );

  factory CompradorHistorialCompraModel.fromJson(
      Map<String, dynamic> historial) {
    return CompradorHistorialCompraModel(
      idCompra: historial["idcompra"].toString(),
      nombreEmpresa: historial["nombreEmpresa"],
      nombreProducto: historial["nombreProducto"],
      cantidad: historial["cantidad"].toString(),
      descripcionProducto: historial["descripcionProducto"],
      precio: historial["precio"].toString(),
      total: historial["total"].toString(),
      fechaCompra: historial["fechaCompra"],
      estatusEntrega: historial["estatus"],
      idUsuario: historial["idUsuario"].toString(),
      idEmpresa: historial["idvendedor"].toString(),
      estatusPago: historial["estatusPago"],
      ubicacion: historial["ubicacion"],
      tipoEnvio: historial["empresaenvio"],
      image: historial["image"],
    );
  }
  factory CompradorHistorialCompraModel.fromEntity(
      CompradorHistorialCompra historial) {
    return CompradorHistorialCompraModel(
      idCompra: historial.idCompra,
      nombreEmpresa: historial.nombreEmpresa,
      nombreProducto: historial.nombreProducto,
      cantidad: historial.cantidad,
      descripcionProducto: historial.descripcionProducto,
      precio: historial.precio,
      total: historial.total,
      fechaCompra: historial.fechaCompra,
      estatusPago: historial.estatusPago,
      estatusEntrega: historial.estatusEntrega,
      ubicacion: historial.ubicacion,
      tipoEnvio: historial.tipoEnvio,
      idUsuario: historial.idUsuario,
      idEmpresa: historial.idEmpresa,
      image: historial.image,
    );
  }
}
