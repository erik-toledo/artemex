import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../inicio_sesion/presentation/bloc/inicio_sesion_bloc.dart';

class ComercianteVerificacionPage extends StatefulWidget {
  const ComercianteVerificacionPage({super.key});

  @override
  State<ComercianteVerificacionPage> createState() =>
      _ComercianteVerificacionPageState();
}

class _ComercianteVerificacionPageState
    extends State<ComercianteVerificacionPage> {
  final nombreEmpresaController = TextEditingController();
  final estadoController = TextEditingController();
  final telefonoController = TextEditingController();
  final rfcController = TextEditingController();
  Comerciante? comerciante;

  @override
  void initState() {
    extraerDatos();
    super.initState();
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
            titulo: 'Verificación',
            regresar: false,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Nombre de la empresa',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: Row(
                    children: [
                      Container(
                        width: ancho / 1.1,
                        height: alto / 14,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(228, 227, 227, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 29),
                          child: TextField(
                            textAlign: TextAlign.left,
                            enabled: false,
                            controller: nombreEmpresaController,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 7),
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Artesanias Mx',
                                hintStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: const Color.fromRGBO(
                                        201, 201, 201, 1))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Estado',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: Row(
                    children: [
                      Container(
                        width: ancho / 1.1,
                        height: alto / 14,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(228, 227, 227, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 29),
                          child: TextField(
                            enabled: false,
                            textAlign: TextAlign.left,
                            controller: estadoController,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 7),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Chiapas',
                                hintStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: const Color.fromRGBO(
                                        201, 201, 201, 1))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Teléfono',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: Row(
                    children: [
                      Container(
                        width: ancho / 1.1,
                        height: alto / 14,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(228, 227, 227, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 29),
                          child: TextField(
                            enabled: false,
                            textAlign: TextAlign.left,
                            controller: telefonoController,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 7),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Número telefonico',
                                hintStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: const Color.fromRGBO(
                                        201, 201, 201, 1))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'RFC',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: Row(
                    children: [
                      Container(
                        width: ancho / 1.1,
                        height: alto / 14,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(228, 227, 227, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 29),
                          child: TextField(
                            enabled: false,
                            textAlign: TextAlign.left,
                            controller: rfcController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 7),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'RDL0904102F4',
                              hintStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: const Color.fromRGBO(201, 201, 201, 1),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: alto / 8.5),
                SizedBox(
                  width: ancho / 1.3,
                  height: alto / 12,
                  child: Text(
                    "VERIFICADO",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color(0xff1D9BF0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void extraerDatos() async {
    Object response =
        await context.read<InicioSesionBloc>().obtenerInformacionUsuario();
    if (response is Comerciante) {
      setState(() {
        comerciante = response;
        nombreEmpresaController.text = comerciante!.nombreEmpresa;
        estadoController.text = comerciante!.estado;
        telefonoController.text = comerciante!.numeroTelefonico;
        rfcController.text = comerciante!.rfc;
      });
    }
  }
}
