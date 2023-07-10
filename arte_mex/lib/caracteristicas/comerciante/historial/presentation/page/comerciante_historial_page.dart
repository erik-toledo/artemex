import 'package:flutter/material.dart';

import '../../../../../widgets_reutilizables/reutilizable_widget_Appbar.dart';
import 'comerciante_card_historial_page.dart';

class ComercianteHistorialPage extends StatefulWidget {
  const ComercianteHistorialPage({super.key});

  @override
  State<ComercianteHistorialPage> createState() =>
      _ComercianteHistorialPageState();
}

class _ComercianteHistorialPageState extends State<ComercianteHistorialPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          ReutilizableWidgetAppbar(
              ancho: ancho, alto: alto, titulo: 'Historial de ventas'),
          SizedBox(
            width: ancho,
            height: alto / 1.2,
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return ComercianteCardHistorialPage(ancho: ancho, alto: alto);
              },
            ),
          ),
        ],
      ),
    );
  }
}
