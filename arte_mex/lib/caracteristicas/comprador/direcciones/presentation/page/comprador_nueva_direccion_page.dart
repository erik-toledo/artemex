import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/bloc/comprador_direccion_bloc.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../../../utilidad/bloqueo_captura_pantalla.dart';

class CompradorNuevaDireccionPage extends StatefulWidget {
  final String idUsuario;
  const CompradorNuevaDireccionPage({super.key, required this.idUsuario});

  @override
  State<CompradorNuevaDireccionPage> createState() =>
      _CompradorNuevaDireccionPageState();
}

class _CompradorNuevaDireccionPageState
    extends State<CompradorNuevaDireccionPage> {
  @override
  void initState() {
    bloquearCapturaPantalla();
    super.initState();
  }

  final controllerEstado = TextEditingController();
  final controllerCodigoP = TextEditingController();
  final controllerMunicipio = TextEditingController();
  final controllerCalle = TextEditingController();
  final controllerNumExte = TextEditingController();
  final controllerNumInt = TextEditingController();
  final controllerNumContacto = TextEditingController();
  final controllerDescripcionDom = TextEditingController();
  bool cargando = false;
  @override
  Widget build(BuildContext context) {
    final String idComprador = widget.idUsuario;
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: 'Agregar dirección',
            regresar: true,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: alto / 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: ancho / 1.1,
                height: alto / 1.4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ancho / 1.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Estado',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Codigo postal',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: ancho / 1.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ancho / 2.5,
                              height: alto / 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0XFFE4E3E3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: controllerEstado,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintText: 'Chiapas',
                                      hintStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        color: const Color(0xffC9C9C9),
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              width: ancho / 2.5,
                              height: alto / 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0XFFE4E3E3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: controllerCodigoP,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintText: '29000',
                                      hintStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        color: const Color(0xffC9C9C9),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Municipio',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        width: ancho / 1.1,
                        height: alto / 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0XFFE4E3E3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: controllerMunicipio,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10),
                                border: InputBorder.none,
                                hintText: 'Suchiapa',
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: const Color(0xffC9C9C9),
                                )),
                          ),
                        ),
                      ),
                      Text(
                        'Calle',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        width: ancho / 1.1,
                        height: alto / 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0XFFE4E3E3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: controllerCalle,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10),
                                border: InputBorder.none,
                                hintText: 'Av. Septima poniente',
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: const Color(0xffC9C9C9),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ancho / 1.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Num. Exterior',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Num. Interior',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: ancho / 1.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ancho / 2.5,
                              height: alto / 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0XFFE4E3E3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: controllerNumExte,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintText: '808',
                                      hintStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        color: const Color(0xffC9C9C9),
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              width: ancho / 2.5,
                              height: alto / 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0XFFE4E3E3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: controllerNumInt,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintText: '1',
                                      hintStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                        color: const Color(0xffC9C9C9),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Número de contacto',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        width: ancho / 1.1,
                        height: alto / 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0XFFE4E3E3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: controllerNumContacto,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10),
                                border: InputBorder.none,
                                hintText: '9663234455',
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: const Color(0xffC9C9C9),
                                )),
                          ),
                        ),
                      ),
                      Text(
                        'Descripción del domicilio',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: ancho / 1.1,
                          height: alto / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0XFFE4E3E3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: controllerDescripcionDom,
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(bottom: 10),
                                  border: InputBorder.none,
                                  hintText: 'Casa verde con portón blanco',
                                  hintStyle: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10,
                                    color: const Color(0xffC9C9C9),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: alto / 20),
            SizedBox(
              width: ancho / 1.05,
              height: alto / 15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
                onPressed: () async {
                  await crearDireccion(context, idComprador);
                },
                child: (!cargando)
                    ? Text(
                        'Guardar direaccion',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.purple,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool verificar() => (controllerEstado.text.isNotEmpty &&
      controllerCodigoP.text.isNotEmpty &&
      controllerMunicipio.text.isNotEmpty &&
      controllerCalle.text.isNotEmpty &&
      controllerNumExte.text.isNotEmpty &&
      controllerNumInt.text.isNotEmpty &&
      controllerNumContacto.text.isNotEmpty &&
      controllerDescripcionDom.text.isNotEmpty);

  Future<bool> crearDireccion(BuildContext context, String idUsuario) async {
    setState(() {
      cargando = !cargando;
    });
    if (verificar()) {
      try {
        bool response = await context
            .read<CompradorDireccionBloc>()
            .crearDireccion(idUsuario, crearObjetoDireccion(idUsuario));


        // ignore: use_build_context_synchronously
        context
            .read<CompradorDireccionBloc>()
            .add(EventBotonObtenerDireccion(idUsuario: idUsuario));
        if (response) {
          debugPrint("Entro if");

          // ignore: use_build_context_synchronously
          showAlerta(
            context,
            QuickAlertType.success,
            "Hecho",
            "Direccion creada con exito",
          );
        } else {
          // ignore: use_build_context_synchronously
          showAlerta(
            context,
            QuickAlertType.error,
            "Error",
            "La direccion no pudo ser creada",
          );
        }
      } catch (e) {
        debugPrint("Entro try");
        rethrow;
      }
    } else {
      showAlerta(
        context,
        QuickAlertType.error,
        "Error",
        "Campos vacios",
      );
    }
    // ignore: use_build_context_synchronously

    setState(() {
      cargando = !cargando;
    });
    return false;
  }

  Direccion crearObjetoDireccion(String idUsuario) => Direccion(
      idUsuario: idUsuario,
      idDireccion: "0",
      estado: controllerEstado.text,
      codigoPostal: controllerCodigoP.text,
      municipio: controllerMunicipio.text,
      calle: controllerCalle.text,
      numExterior: controllerNumExte.text,
      numInterior: controllerNumInt.text,
      numeroTelf: controllerNumContacto.text,
      descripcionDomicilio: controllerDescripcionDom.text);
}
