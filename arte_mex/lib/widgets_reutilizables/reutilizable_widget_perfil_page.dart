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
  final defecto_imagen_comerciante = 'assets/local_imagenes/tienda_perfil.png';
  final defecto_imagen_comprador = 'assets/local_imagenes/perfil.jpg';
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
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
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage((widget.usuario)
                          ? defecto_imagen_comerciante
                          : defecto_imagen_comprador),
                      backgroundColor: const Color(0xff617946),
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
                  'kdbruna@gmail.com',
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, top: 8, right: 8, bottom: 2),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, top: 8, right: 8, bottom: 2),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, top: 8, right: 8, bottom: 2),
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
                ],
              ),
            )
          ],
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
              'Artesanías Mx',
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
        'Kevin Debruyna',
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
}
