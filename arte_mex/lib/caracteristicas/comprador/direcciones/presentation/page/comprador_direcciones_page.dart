import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/page/widgets/comprador_card_direccion.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/direccion.dart';
import 'comprador_nueva_direccion_page.dart';

class CompradorDireccionesPage extends StatefulWidget {
  const CompradorDireccionesPage({super.key});

  @override
  State<CompradorDireccionesPage> createState() =>
      _CompradorDireccionesPageState();
}

class _CompradorDireccionesPageState extends State<CompradorDireccionesPage> {
  List<Direccion> direcciones = [
    Direccion(
        estado: "Chiapas",
        codigoPostal: "29150",
        municipio: "Suchiapa",
        calle: "Av. Primera Nte. Ote. 800",
        numExterior: "808",
        numInterior: "1",
        numeroTelf: "9661156789",
        descripcionDomicilio: "Casa gris"),
    Direccion(
        estado: "Chiapas",
        codigoPostal: "29150",
        municipio: "Suchiapa",
        calle: "Av. Primera Nte. Ote. 800",
        numExterior: "808",
        numInterior: "1",
        numeroTelf: "9661156789",
        descripcionDomicilio: "Casa gris"),
  ];
  Direccion? direccion;
  int esIgual = -1;
  void cardSeleccionda(int index) {
    setState(() {
      direccion = direcciones[index];
      esIgual = index;
    });
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
            titulo: 'Direcciones',
            regresar: true,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Direcciones registradas',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: ancho / 1.1,
            height: alto / 1.5,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return CompradorCardDireccion(
                  alto: alto,
                  ancho: ancho,
                  esSeleccionado: (esIgual == index),
                  onTap: () => cardSeleccionda(index),
                  direccion: direcciones[index],
                );
              },
            ),
          ),
          SizedBox(height: alto / 15),
          SizedBox(
            width: ancho / 1.1,
            height: alto / 14,
            child: ElevatedButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                  builder: (context) => const CompradorNuevaDireccionPage(),
                );
                Navigator.push(context, route);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              child: Text(
                'Nueva dirección',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
