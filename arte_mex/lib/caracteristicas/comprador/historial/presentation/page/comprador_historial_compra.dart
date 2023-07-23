import 'package:arte_mex/caracteristicas/comprador/historial/presentation/page/widget/comprador_card_compra.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';

class CompradorHistorialCompraPage extends StatefulWidget {
  const CompradorHistorialCompraPage({super.key});

  @override
  State<CompradorHistorialCompraPage> createState() =>
      _CompradorHistorialCompraPageState();
}

class _CompradorHistorialCompraPageState
    extends State<CompradorHistorialCompraPage> {
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
            titulo: 'Historial de compras',
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ancho / 1.1,
              height: alto / 1.3,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CompradorCardCompra(
                    ancho: ancho,
                    alto: alto,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
