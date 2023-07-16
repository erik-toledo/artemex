import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComercianteRegistroProductoPage extends StatefulWidget {
  const ComercianteRegistroProductoPage({super.key});

  @override
  State<ComercianteRegistroProductoPage> createState() =>
      _ComercianteRegistroProductoPageState();
}

class _ComercianteRegistroProductoPageState
    extends State<ComercianteRegistroProductoPage> {
  final controllerNombre = TextEditingController();
  final controllerEstado = TextEditingController();
  final controllerDescripcion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReutilizableWidgetAppbar(
                ancho: ancho,
                alto: alto,
                titulo: 'Registro de productos',
                regresar: true),
            SizedBox(
              width: ancho / 1.2,
              height: alto / 1.23,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: inputText(
                      "Nombre",
                      ancho,
                      alto / 10,
                      controllerNombre,
                    ),
                  ),
                  inputText(
                    "Estado",
                    ancho,
                    alto / 10,
                    controllerEstado,
                  ),
                  Row(
                    children: [
                      inputText(
                        "Precio",
                        ancho / 3,
                        alto / 10,
                        controllerEstado,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: inputText(
                          "Cantidad",
                          ancho / 2.45,
                          alto / 10,
                          controllerEstado,
                        ),
                      ),
                    ],
                  ),
                  inputTextLarge(
                    "Descripción del producto",
                    ancho,
                    alto / 6,
                    controllerDescripcion,
                  ),
                  inputTextLarge(
                    "Descripción del producto",
                    ancho,
                    alto / 6,
                    controllerDescripcion,
                  ),
                  images(
                    "Imagenes del producto",
                    ancho,
                    alto / 6,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                width: ancho / 1.1,
                height: alto / 15,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {},
                    child: Text(
                      'Registrar',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputText(String titulo, double ancho, double alto,
      TextEditingController controller) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                titulo,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            width: ancho,
            height: alto / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(228, 227, 227, 1),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }

  Widget inputTextLarge(String titulo, double ancho, double alto,
      TextEditingController controller) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                titulo,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            width: ancho,
            height: alto / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(228, 227, 227, 1),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }

  Widget images(
    String titulo,
    double ancho,
    double alto,
  ) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                titulo,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: ancho / 4,
                height: alto / 1.5,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                width: ancho / 4,
                height: alto / 1.5,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                width: ancho / 4,
                height: alto / 1.5,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
