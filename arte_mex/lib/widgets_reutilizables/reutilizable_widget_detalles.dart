import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/entities/pedido.dart';
import 'package:arte_mex/widgets_reutilizables/card_detalle.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReutilizableWidgetDetalles extends StatefulWidget {
  final Pedido producto;
  const ReutilizableWidgetDetalles({super.key, required this.producto});

  @override
  State<ReutilizableWidgetDetalles> createState() =>
      _ReutilizableWidgetDetallesState();
}

class _ReutilizableWidgetDetallesState
    extends State<ReutilizableWidgetDetalles> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    final Pedido producto = widget.producto;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: "Detalles",
            regresar: true,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "${producto.nombreEmpresa}\n",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: producto.nombreProducto,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, left: 5),
                    child: SvgPicture.asset(
                      "assets/imagenes_iconos_card/verificado.svg",
                      colorFilter: const ColorFilter.mode(
                          Color(0xff1D9BF0), BlendMode.srcIn),
                      width: 15,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: ancho,
                height: alto / 1.3,
                child: CarDetalle(
                    productoObtenido: widget.producto,
                    ancho: ancho,
                    alto: alto),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
