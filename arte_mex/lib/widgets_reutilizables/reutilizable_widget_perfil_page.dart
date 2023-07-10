import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReutilizableWidgetPerfil extends StatefulWidget {
  final List<String> titulos;
  final List<Widget> vistas;
  const ReutilizableWidgetPerfil(
      {super.key, required this.titulos, required this.vistas});

  @override
  State<ReutilizableWidgetPerfil> createState() =>
      _ReutilizableWidgetPerfilState();
}

class _ReutilizableWidgetPerfilState extends State<ReutilizableWidgetPerfil> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: ancho,
              height: alto / 2.45,
              child: Column(
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
                      child: const CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage('assets/local_imagenes/perfil.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
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
                  ),
                  SizedBox(
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
                  )
                ],
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
                                Route route = MaterialPageRoute(builder: (context) => widget.vistas[0],);
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
}
