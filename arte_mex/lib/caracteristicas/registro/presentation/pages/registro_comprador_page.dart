// ignore_for_file: use_build_context_synchronously

import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/caracteristicas/registro/presentation/bloc/registro_comprador/registro_comprador_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../../utilidad/bloqueo_captura_pantalla.dart';

class RegistroCompradorPage extends StatefulWidget {
  const RegistroCompradorPage({super.key});

  @override
  State<RegistroCompradorPage> createState() => _RegistroCompradorPageState();
}

class _RegistroCompradorPageState extends State<RegistroCompradorPage> {
  @override
  void initState() {
    bloquearCapturaPantalla();
    super.initState();
  }

  final controllerNombre = TextEditingController();
  final controllerApellido = TextEditingController();
  final controllerCorreo = TextEditingController();
  final controllerContrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: ancho,
                height: alto / 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(fit: StackFit.expand, children: [
                    Image.asset(
                      "assets/imagenes_registro/comprador.jpg",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: ancho,
                        height: alto / 3.6,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                padding: const EdgeInsets.only(right: 10),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            Text(
                              "Comprador",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(height: alto / 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: ancho,
                height: alto / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    inputNombreApellido(ancho / 2.6, alto / 13, "nombre",
                        "Nombre", "Apellido", TextInputType.text),
                    input(ancho / 1.24, alto / 13, "arroba", "Correo",
                        controllerCorreo, TextInputType.emailAddress),
                    input(ancho / 1.24, alto / 13, "contrasena", "Contraseña",
                        controllerContrasena, TextInputType.text),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: ancho / 1.21,
                          height: alto / 15,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Al registrarse acepta nuestros",
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9,
                                      color: const Color(0xffD0D0D0),
                                    ),
                                  ),
                                  Text(
                                    " Términos y Condiciones",
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9,
                                      color: Colors.purple,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " y",
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9,
                                      color: const Color(0xffD0D0D0),
                                    ),
                                  ),
                                  Text(
                                    " Políticas de privacidad",
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9,
                                      color: Colors.purple,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: ancho / 1.1,
                    height: alto / 12,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.purple,
                          elevation: 0,
                        ),
                        onPressed: () async {
                          if (await crearComprador()) {
                            showAlerta(context, QuickAlertType.success, "Hecho",
                                "Comprador registrado exitosamente");
                          } else {
                            showAlertaVistaInicio(context, QuickAlertType.error,
                                "Error", "No se pudo registar por el moento");
                          }
                        },
                        child: Text(
                          "Registrarse",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row input(double ancho, double alto, String icono, String textHint,
      TextEditingController controller, TextInputType inputType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/inicio_sesion_iconos/$icono.svg",
          width: 20,
          colorFilter:
              const ColorFilter.mode(Color(0xffEDA812), BlendMode.srcIn),
        ),
        Container(
          width: ancho,
          height: alto,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffD0D0D0),
              ),
            ),
          ),
          child: TextField(
            keyboardType: inputType,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textHint,
              contentPadding: const EdgeInsets.only(bottom: 10),
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: const Color(0xffD0D0D0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row inputNombreApellido(double ancho, double alto, String icono,
      String textHintNombre, String textHintApellido, TextInputType inputType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/inicio_sesion_iconos/$icono.svg",
          width: 20,
          colorFilter:
              const ColorFilter.mode(Color(0xffEDA812), BlendMode.srcIn),
        ),
        Container(
          width: ancho,
          height: alto,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffD0D0D0),
              ),
            ),
          ),
          child: TextField(
            keyboardType: inputType,
            controller: controllerNombre,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textHintNombre,
              contentPadding: const EdgeInsets.only(
                bottom: 10,
              ),
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: const Color(0xffD0D0D0),
              ),
            ),
          ),
        ),
        Container(
          width: ancho,
          height: alto,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffD0D0D0),
              ),
            ),
          ),
          child: TextField(
            keyboardType: inputType,
            controller: controllerApellido,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textHintApellido,
              contentPadding: const EdgeInsets.only(
                bottom: 10,
              ),
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: const Color(0xffD0D0D0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Comprador comprador() => Comprador(
        idComprador: "0",
        nombre: controllerNombre.text,
        apellidos: controllerApellido.text,
        correo: controllerCorreo.text,
        contrasena: controllerContrasena.text,
        tipoUsuario: "COMPRADOR",
      );

  bool verficarCampos() => (controllerNombre.text.isNotEmpty &&
      controllerApellido.text.isNotEmpty &&
      controllerCorreo.text.isNotEmpty &&
      controllerContrasena.text.isNotEmpty);
  Future<bool> crearComprador() async {
    if (verficarCampos()) {
      return await context
          .read<RegistroCompradorBloc>()
          .registrarComprador(comprador());
    }
    return false;
  }
}
