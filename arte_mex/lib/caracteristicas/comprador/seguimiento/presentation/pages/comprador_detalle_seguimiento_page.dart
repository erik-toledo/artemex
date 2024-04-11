import 'package:arte_mex/caracteristicas/comprador/seguimiento/presentation/pages/widgets/comprador_card_detalle_seguimiento.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../comprar/domain/entities/compra.dart';

class CompradorDetalleSeguimentoPage extends StatefulWidget {
  final Compra compra;
  const CompradorDetalleSeguimentoPage({super.key, required this.compra});

  @override
  State<CompradorDetalleSeguimentoPage> createState() =>
      _CompradorDetalleSeguimentoPageState();
}

class _CompradorDetalleSeguimentoPageState
    extends State<CompradorDetalleSeguimentoPage> {
  bool? enCamino;
  bool? entregado;
  @override
  void initState() {
    entregado = (widget.compra.estatusEntrega == "ENTREGADO");
    enCamino = (widget.compra.estatusEntrega == "ENVIADO" || entregado == true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: "Detalle del seguimiento",
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: SizedBox(
            width: ancho,
            height: alto / 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    circuloEstados(ancho, alto, "Recolectado", "1", true),
                    CustomPaint(
                      size: const Size(40, 100),
                      painter: Line(
                        p1: const Offset(-7, 40),
                        p2: const Offset(40, 40),
                        estatus: true,
                      ),
                    ),
                    circuloEstados(ancho, alto, "En camino", "2", enCamino),
                    CustomPaint(
                      size: const Size(40, 100),
                      painter: Line(
                        p1: const Offset(0, 40),
                        p2: const Offset(50, 40),
                        estatus: entregado,
                      ),
                    ),
                    circuloEstados(ancho, alto, "Entregado", "3", entregado),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: ancho / 1.1,
                        height: alto / 1.8,
                        child: CompradorCardDetalleSeguimiento(
                            ancho: ancho, alto: alto, compra: widget.compra),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column circuloEstados(double ancho, double alto, String titulo, String numero,
      bool? estatusEntrega) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: ancho / 5,
          height: alto / 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (estatusEntrega!)
                ? const Color(0xff00AC47)
                : const Color(0xffE2E2E2),
          ),
          child: Container(
            alignment: Alignment.center,
            width: ancho / 5.9,
            height: alto / 8.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (estatusEntrega) ? const Color(0xff00AC47) : Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Text(
              numero,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: (estatusEntrega) ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        Text(
          titulo,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}

class Line extends CustomPainter {
  final Offset p1;
  final Offset p2;
  final bool? estatus;
  Line({
    required this.p1,
    required this.p2,
    required this.estatus,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (estatus!) ? const Color(0xff00AC47) : const Color(0xffE2E2E2)
      ..strokeWidth = 6;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
