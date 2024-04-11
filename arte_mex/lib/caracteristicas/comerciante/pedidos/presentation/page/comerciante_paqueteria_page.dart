import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/page/widgets/comerciante_card_paqueteria.dart';

import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_Appbar.dart';
import 'package:flutter/material.dart';

class ComerciantePaquetriaPage extends StatefulWidget {
  final String idPedido;
  final String idComerciante;
  const ComerciantePaquetriaPage(
      {super.key, required this.idPedido, required this.idComerciante});

  @override
  State<ComerciantePaquetriaPage> createState() =>
      _ComerciantePaquetriaPageState();
}

class _ComerciantePaquetriaPageState extends State<ComerciantePaquetriaPage> {
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
            titulo: "Paqueteria",
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ComercianteCardPaqueteria(
                ancho: ancho,
                alto: alto,
                empresa: "DHL express",
                pagina: "www.dhl.com",
                colorPrimarioLogo: const Color(0xffFEC900),
                colorSecundarioLogo: const Color(0xffD40609),
                rutaLogo: "assets/imagenes_iconos_card/dhl.svg",
                idPedido: widget.idPedido,
                idVendedor: widget.idComerciante,
              ),
            ),
            ComercianteCardPaqueteria(
              ancho: ancho,
              alto: alto,
              empresa: "Fedex express",
              pagina: "www.fedex.com",
              colorPrimarioLogo: const Color(0xffFF6600),
              colorSecundarioLogo: const Color(0xff4D148C),
              rutaLogo: "assets/imagenes_iconos_card/fedex.svg",
              idVendedor: widget.idComerciante,
              idPedido: widget.idPedido,
            ),
          ],
        ),
      ),
    );
  }
}
