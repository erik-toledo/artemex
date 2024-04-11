import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/presentation/pages/iniciar_sesion_page.dart';
import 'package:arte_mex/utilidad/obtener_perfil_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReutilizableWidgetPerfil extends StatefulWidget {
  final List<String> titulos;
  final List<Widget> vistas;
  final bool usuario;
  const ReutilizableWidgetPerfil(
      {super.key,
      required this.titulos,
      required this.vistas,
      required this.usuario});

  @override
  State<ReutilizableWidgetPerfil> createState() =>
      _ReutilizableWidgetPerfilState();
}

class _ReutilizableWidgetPerfilState extends State<ReutilizableWidgetPerfil> {
  Comerciante? comerciante;
  Comprador? comprador;
  @override
  void initState() {
    obtenerPeril(context);
    obtenerPerfilComprador(context);
    super.initState();
  }

  final defectoImagencomerciante = 'assets/local_imagenes/tienda_perfil.png';
  final defectoImagenComprador = 'assets/local_imagenes/perfil.jpg';

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: alto / 3.5,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Color.fromRGBO(0, 0, 0, .250),
                            )
                          ]),
                      child: (widget.usuario)
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  AssetImage(defectoImagencomerciante),
                              backgroundColor: const Color(0xff617946),
                            )
                          : SvgPicture.asset(
                              "assets/inicio_sesion_iconos/usuario.svg",
                              width: 150,
                            ),
                    ),
                  ),
                  (widget.usuario)
                      ? nombreUsuarioComerciante(ancho, alto)
                      : nombreUsuarioComprador(ancho, alto),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: ancho / 1.55,
                  height: alto / 25,
                  child: Text(
                    obtenerCorreo(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color.fromRGBO(130, 130, 130, 1),
                      color: const Color.fromRGBO(130, 130, 130, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ancho / 1.2,
                height: alto / 2.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 2),
                      child: InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => widget.vistas[0],
                          );
                          Navigator.push(context, route);
                        },
                        child: Container(
                          width: ancho / 1.2,
                          height: alto / 12,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 33),
                                alignment: Alignment.centerLeft,
                                width: ancho / 2,
                                height: alto / 10,
                                child: Text(
                                  widget.titulos[0],
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: ancho / 4,
                                height: alto / 10,
                                child: IconButton(
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                      builder: (context) => widget.vistas[0],
                                    );
                                    Navigator.push(context, route);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 2),
                      child: InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => widget.vistas[1],
                          );
                          Navigator.push(context, route);
                        },
                        child: Container(
                          width: ancho / 1.2,
                          height: alto / 12,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 33),
                                alignment: Alignment.centerLeft,
                                width: ancho / 2,
                                height: alto / 10,
                                child: Text(
                                  widget.titulos[1],
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: ancho / 4,
                                height: alto / 10,
                                child: IconButton(
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                      builder: (context) => widget.vistas[1],
                                    );
                                    Navigator.push(context, route);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 2),
                      child: InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => widget.vistas[2],
                          );
                          Navigator.push(context, route);
                        },
                        child: Container(
                          width: ancho / 1.2,
                          height: alto / 12,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 33),
                                alignment: Alignment.centerLeft,
                                width: ancho / 2,
                                height: alto / 10,
                                child: Text(
                                  widget.titulos[2],
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: ancho / 4,
                                height: alto / 10,
                                child: IconButton(
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                      builder: (context) => widget.vistas[2],
                                    );
                                    Navigator.push(context, route);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 2),
                      child: InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => widget.vistas[3],
                          );
                          Navigator.push(context, route);
                        },
                        child: Container(
                          width: ancho / 1.2,
                          height: alto / 12,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 33),
                                alignment: Alignment.centerLeft,
                                width: ancho / 2,
                                height: alto / 10,
                                child: Text(
                                  widget.titulos[3],
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: ancho / 4,
                                height: alto / 10,
                                child: IconButton(
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                      builder: (context) => widget.vistas[3],
                                    );
                                    Navigator.push(context, route);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  width: ancho / 3.2,
                  height: alto / 15,
                  child: ElevatedButton(
                      onPressed: () {
                        Route route = MaterialPageRoute(
                          builder: (context) => const IniciarSesionPage(),
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pushAndRemoveUntil(
                            context, route, (Route<dynamic> route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Salir',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          const Icon(
                            Icons.output_rounded,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox nombreUsuarioComerciante(double ancho, double alto) {
    return SizedBox(
      width: ancho / 1.1,
      height: alto / 13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: ancho / 1.4,
            child: Text(
              (comerciante != null) ? comerciante!.nombreEmpresa : "Empresa",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  shadows: <BoxShadow>[
                    const BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, .250))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SvgPicture.asset(
              'assets/imagenes_iconos_card/verificado.svg',
              width: 20,
              colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(29, 155, 240, 1), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox nombreUsuarioComprador(double ancho, double alto) {
    return SizedBox(
      width: ancho / 1.1,
      height: alto / 13,
      child: Text(
        (comprador != null)
            ? "${comprador!.nombre} ${comprador!.apellidos}"
            : "Comprador",
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            shadows: <BoxShadow>[
              const BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, .250))
            ]),
      ),
    );
  }

  String obtenerCorreo() {
    if (comerciante != null) {
      return comerciante!.correo;
    } else if (comprador != null) {
      return comprador!.correo;
    }
    return "example@gmail.com";
  }

  void obtenerPeril(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comerciante) {
      setState(() {
        comerciante = response;
      });
    }
  }

  void obtenerPerfilComprador(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comprador) {
      setState(() {
        comprador = response;
      });
    }
  }
}
