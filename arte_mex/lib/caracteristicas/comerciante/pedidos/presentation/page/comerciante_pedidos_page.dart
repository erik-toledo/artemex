import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/page/comerciante_card_pedidos_page.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets_reutilizables/reutilizable_widget_Appbar.dart';

class ComerciantePedidosPage extends StatefulWidget {
  const ComerciantePedidosPage({super.key});

  @override
  State<ComerciantePedidosPage> createState() => _ComerciantePedidosPageState();
}

class _ComerciantePedidosPageState extends State<ComerciantePedidosPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          ReutilizableWidgetAppbar(
              ancho: ancho, alto: alto, titulo: 'Pedidos', regresar: true),
          SizedBox(
            width: ancho,
            height: alto / 1.2,
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return ComercianteCardPedidosPage(ancho: ancho, alto: alto);
              },
            ),
          ),
        ],
      ),
    );
  }
}
