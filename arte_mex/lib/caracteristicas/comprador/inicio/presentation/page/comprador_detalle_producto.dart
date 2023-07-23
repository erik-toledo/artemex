import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/widgets/comprador_card_detalle_producto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorDetalleProducto extends StatefulWidget {
  const CompradorDetalleProducto({super.key});

  @override
  State<CompradorDetalleProducto> createState() =>
      _CompradorDetalleProductoState();
}

class _CompradorDetalleProductoState extends State<CompradorDetalleProducto> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          Container(
            width: ancho,
            height: alto / 8.35,
            color: Colors.purple,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: ancho / 7,
                  height: alto,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: ancho / 1.17,
                  height: alto,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: ancho / 1.4,
                            height: alto / 17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ARTE  ',
                                  style: GoogleFonts.simonetta(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28,
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
                                    fontSize: 28,
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
                                    fontSize: 28,
                                    color:
                                        const Color.fromRGBO(234, 168, 18, 1),
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
                                    fontSize: 28,
                                    color:
                                        const Color.fromRGBO(206, 49, 119, 1),
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
                          SizedBox(
                            width: ancho / 1.4,
                            height: alto / 53.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Producto',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: ancho / 7.5,
                        height: alto,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned(
                              left: 20.5,
                              top: 14,
                              child: Text(
                                '0',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SvgPicture.asset(
                                'assets/imagenes_iconos_comerciante/carrito.svg',
                                width: 25,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Artesanias Mx\n",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Licor artesanal",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, left: 5),
                    child: SvgPicture.asset(
                      "assets/imagenes_iconos_card/verificado.svg",
                      colorFilter: const ColorFilter.mode(
                          Color(0xff1D9BF0), BlendMode.srcIn),
                      width: 15,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: ancho,
                height: alto / 1.3,
                child: CompradorCardDetalleProducto(
                    ancho: ancho, alto: alto, cantidadProducto: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
