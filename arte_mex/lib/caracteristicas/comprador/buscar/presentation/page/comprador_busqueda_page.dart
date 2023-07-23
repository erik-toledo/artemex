import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';

class CompradorBusquedaPage extends StatefulWidget {
  const CompradorBusquedaPage({super.key});

  @override
  State<CompradorBusquedaPage> createState() => _CompradorBusquedaPageState();
}

class _CompradorBusquedaPageState extends State<CompradorBusquedaPage> {
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
            titulo: "Búsqueda",
            regresar: false,
          ),
        ],
      ),
    );
  }
}
