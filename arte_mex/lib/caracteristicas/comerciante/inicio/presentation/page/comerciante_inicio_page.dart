import 'package:arte_mex/caracteristicas/comerciante/inicio/presentation/page/widgets/comerciante_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ComercianteInicioPage extends StatefulWidget {
  const ComercianteInicioPage({super.key});

  @override
  State<ComercianteInicioPage> createState() => _ComercianteInicioPageState();
}

class _ComercianteInicioPageState extends State<ComercianteInicioPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 13, 211, 1),
        title: SizedBox(
          width: ancho,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ARTE  ',
                style: GoogleFonts.simonetta(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: Colors.white,
                  shadows: <BoxShadow>[
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, .250),
                    ),
                  ],
                ),
              ),
              Text(
                'M',
                style: GoogleFonts.simonetta(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: const Color.fromRGBO(97, 121, 70, 1),
                  shadows: <BoxShadow>[
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, .250),
                    ),
                  ],
                ),
              ),
              Text(
                'E',
                style: GoogleFonts.simonetta(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: const Color.fromRGBO(234, 168, 18, 1),
                  shadows: <BoxShadow>[
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, .250),
                    ),
                  ],
                ),
              ),
              Text(
                'X',
                style: GoogleFonts.simonetta(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: const Color.fromRGBO(206, 49, 119, 1),
                  shadows: <BoxShadow>[
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, .250),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //ciculos estados
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/imagenes_iconos_card/tienda.svg',
                  width: 35,
                  colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(255, 191, 53, 1), BlendMode.srcIn),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                Text(
                  'Hola, ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Artesanias Mx',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SvgPicture.asset(
                    'assets/imagenes_iconos_card/verificado.svg',
                    width: 20,
                    colorFilter: const ColorFilter.mode(
                        Color.fromRGBO(29, 155, 240, 1), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Envios pendientes',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: const Color.fromRGBO(144, 13, 211, 1)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: ancho / 1.1,
            height: alto / 2.3,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          cardTipoLarga(ancho / 1.2, alto / 2.5),
                          cardTipoLarga(ancho / 1.2, alto / 2.5),
                          cardTipoLarga(ancho / 1.2, alto / 2.5)
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
