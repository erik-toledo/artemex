import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/page/widgets/comerciante_card_estatus_producto.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';

class ComercianteEstatusProductos extends StatefulWidget {
  const ComercianteEstatusProductos({super.key});

  @override
  State<ComercianteEstatusProductos> createState() =>
      _ComercianteEstatusProductosState();
}

class _ComercianteEstatusProductosState
    extends State<ComercianteEstatusProductos> {
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
            titulo: 'Estatus productos',
            regresar: true,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: ancho,
            height: alto / 1.40,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ComercianteCardEstatusProducto(ancho: ancho, alto: alto);
              },
            ),
          ),
        ],
      ),
    );
  }
}
