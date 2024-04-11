import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../caracteristicas/comprador/historial/domain/entities/comprador_historial_compra.dart';

class CardDetalleHistorialCompra extends StatefulWidget {
  final double ancho;
  final double alto;
  final CompradorHistorialCompra historialCompra;
  const CardDetalleHistorialCompra(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.historialCompra});

  @override
  State<CardDetalleHistorialCompra> createState() =>
      _CardDetalleHistorialCompraState();
}

class _CardDetalleHistorialCompraState
    extends State<CardDetalleHistorialCompra> {
  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    final CompradorHistorialCompra producto = widget.historialCompra;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ancho,
              height: alto / 1.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
                imageUrl: producto.image,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Total: \u{0024}",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  "${producto.total}.00",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      shadows: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 8,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        )
                      ]),
                ),
              ],
            ),
            Text(
              'Cantidad solicitada',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 15,
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "Cantidad: ",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.8,
                      child: Text(producto.cantidad),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Fecha de compra",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffEAEAEA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    producto.fechaCompra,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Paqueteria",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffEAEAEA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    producto.tipoEnvio,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Descripcion del producto",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffEAEAEA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    producto.descripcionProducto,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
