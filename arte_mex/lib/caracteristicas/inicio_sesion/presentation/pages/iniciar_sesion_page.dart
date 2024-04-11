// ignore_for_file: use_build_context_synchronously

import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/sesion.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/presentation/bloc/inicio_sesion_bloc.dart';
import 'package:arte_mex/caracteristicas/registro/presentation/pages/registro_comerciante_page.dart';
import 'package:arte_mex/caracteristicas/registro/presentation/pages/registro_comprador_page.dart';
import 'package:arte_mex/navbar/navbar_comerciante/navbar_comerciante_route.dart';
import 'package:arte_mex/navbar/navbar_comprador/navbar_comprador_route.dart';
import 'package:arte_mex/utilidad/bloqueo_captura_pantalla.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';

class IniciarSesionPage extends StatefulWidget {
  const IniciarSesionPage({super.key});

  @override
  State<IniciarSesionPage> createState() => _IniciarSesionPageState();
}

class _IniciarSesionPageState extends State<IniciarSesionPage> {
  @override
  void initState() {
    bloquearCapturaPantalla();
    super.initState();
  }

  bool visibilidad = true;
  final controllerCorreo = TextEditingController();
  final controllerContrasena = TextEditingController();
  bool respuesta = true;
  bool mostrarProgress = true;
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                width: ancho,
                height: alto / 3.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: LottieBuilder.asset("assets/animacion/login.json"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inicio de \nsesión",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: alto / 40),
                  Text(
                    "Tu correo electrónico",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: ancho,
                    height: alto / 13,
                    child: Row(
                      children: [
                        SizedBox(
                          width: ancho / 10,
                          child: SvgPicture.asset(
                            "assets/inicio_sesion_iconos/arroba.svg",
                            width: 20,
                            alignment: Alignment.centerLeft,
                            colorFilter: const ColorFilter.mode(
                                Colors.purple, BlendMode.srcIn),
                          ),
                        ),
                        Container(
                          width: ancho / 1.3,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Color(0xffD0D0D0),
                              ),
                            ),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controllerCorreo,
                            enableIMEPersonalizedLearning: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "tucorreo@gmail.com",
                              contentPadding:
                                  const EdgeInsets.only(bottom: 10, left: 20),
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: const Color(0xffD0D0D0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: alto / 30),
                  Text(
                    "Tu contraseña",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: ancho,
                    height: alto / 13,
                    child: Row(
                      children: [
                        SizedBox(
                          width: ancho / 10,
                          child: SvgPicture.asset(
                            "assets/inicio_sesion_iconos/contrasena.svg",
                            width: 20,
                            alignment: Alignment.centerLeft,
                            colorFilter: const ColorFilter.mode(
                                Colors.purple, BlendMode.srcIn),
                          ),
                        ),
                        Container(
                          width: ancho / 1.3,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Color(0xffD0D0D0),
                              ),
                            ),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: visibilidad,
                            controller: controllerContrasena,
                            obscuringCharacter: "*",
                            enableIMEPersonalizedLearning: false,
                            enableSuggestions: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "********",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      visibilidad = !visibilidad;
                                    });
                                  },
                                  icon: Icon(
                                    (visibilidad)
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.purple,
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10, left: 20),
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: const Color(0xffD0D0D0),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: alto / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ancho / 1.1,
                  height: alto / 13,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.purple,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        Sesion sesion = Sesion(
                            correo: controllerCorreo.text,
                            contrasena: controllerContrasena.text);
                        if (validarCampos()) {
                          setState(() {
                            mostrarProgress = !mostrarProgress;
                          });
                          respuesta = await context
                              .read<InicioSesionBloc>()
                              .inicioSesion(sesion);
                          setState(() {
                            mostrarProgress = !mostrarProgress;
                          });
                          if (respuesta) {
                            cambiarVista(respuesta);
                          } else {
                            showAlertaVistaInicio(
                                context,
                                QuickAlertType.error,
                                "Error en las credenciales",
                                "Usuario o contraseña incorrecta");
                          }
                        }
                      },
                      child: (mostrarProgress)
                          ? Text(
                              "Iniciar sesión",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            )
                          : const CircularProgressIndicator()),
                ),
              ],
            ),
            SizedBox(height: alto / 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "¿No tienes cuenta?",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistroCompradorPage());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              "Comprador",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: const Color(0xffEDA812),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistroComerciantePage());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              "Comerciante",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: const Color(0xff900DD3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validarCampos() => (controllerCorreo.text.isNotEmpty &&
      controllerContrasena.text.isNotEmpty);

  void cambiarVista(bool respuesta) async {
    Object response =
        await context.read<InicioSesionBloc>().obtenerInformacionUsuario();
    if (response is Comerciante) {
      Route route = MaterialPageRoute(
        builder: (context) => const NavbarComercianteRoute(),
      );

      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    } else if (response is Comprador) {
      Route route = MaterialPageRoute(
        builder: (context) => const NavbarCompradorRoute(),
      );

      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    }
  }
}
