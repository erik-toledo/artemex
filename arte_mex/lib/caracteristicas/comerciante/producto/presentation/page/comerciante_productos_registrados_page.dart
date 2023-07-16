import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/comerciante_card_producto_page.dart';

class ComercianteProductosRegistradosPage extends StatefulWidget {
  const ComercianteProductosRegistradosPage({super.key});

  @override
  State<ComercianteProductosRegistradosPage> createState() =>
      _ComercianteProductosRegistradosPageState();
}

class _ComercianteProductosRegistradosPageState
    extends State<ComercianteProductosRegistradosPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          ReutilizableWidgetAppbar(
              ancho: ancho, alto: alto, titulo: ' Productos registrados', regresar: true),
          SizedBox(
            width: ancho,
            height: alto / 1.40,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ComercianteCardProductoPage(ancho: ancho, alto: alto);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: (alto / 11), left: 13, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ancho / 2.2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(5, 142, 247, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Agregar',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
