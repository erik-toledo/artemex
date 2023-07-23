import 'dart:math';

import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/comprador_detalle_producto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorElementoCategoria extends StatefulWidget {
  final double ancho;
  final double alto;
  final String categoria;
  const CompradorElementoCategoria({
    super.key,
    required this.ancho,
    required this.alto,
    required this.categoria,
  });

  @override
  State<CompradorElementoCategoria> createState() =>
      _CompradorElementoCategoriaState();
}

class _CompradorElementoCategoriaState
    extends State<CompradorElementoCategoria> {
  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) => const CompradorDetalleProducto(),
          );
          Navigator.push(context, route);
        },
        child: Container(
          alignment: Alignment.center,
          width: ancho / 5,
          decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            widget.categoria,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: colorAleatorio(),
            ),
          ),
        ),
      ),
    );
  }

  Color colorAleatorio() {
    List<Color> colores = const [
      Color(0xffD09DFC),
      Color(0xff8DBA59),
      Color(0xffF46FAA),
      Color(0xff8DD7CA),
    ];
    int indice = Random().nextInt(colores.length);
    return colores[indice];
  }
}
