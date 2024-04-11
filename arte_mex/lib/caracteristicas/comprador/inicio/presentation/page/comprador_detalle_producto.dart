import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/widgets/comprador_card_detalle_producto.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../../carrito/presentation/bloc/comprador_carrito_bloc.dart';
import '../../../carrito/presentation/pages/comprador_carro_compra_page.dart';

class CompradorDetalleProducto extends StatefulWidget {
  final ObtenerProducto producto;
  const CompradorDetalleProducto({super.key, required this.producto});

  @override
  State<CompradorDetalleProducto> createState() =>
      _CompradorDetalleProductoState();
}

class _CompradorDetalleProductoState extends State<CompradorDetalleProducto> {
  @override
  void initState() {
    obtenerPerfil(context);
    super.initState();
  }

  Comprador? comprador;
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    final ObtenerProducto producto = widget.producto;
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
                      InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) =>
                                const CompradorCarroCompraPage(),
                          );
                          Navigator.push(context, route);
                        },
                        child: SizedBox(
                          width: ancho / 7.5,
                          height: alto,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Positioned(
                                left: 20.5,
                                top: 14,
                                child: BlocBuilder<CompradorCarritoBloc,
                                    CompradorCarritoState>(
                                  builder: (context, state) {
                                    if (state
                                        is CompradorObteniendoCarritoState) {
                                      return Text(
                                        '0',
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                      );
                                    } else if (state
                                        is CompradorCarritoObtenidoState) {
                                      return Text(
                                        state.carro.length.toString(),
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                      );
                                    } else if (state is CompradorCarritoError) {
                                      return Text(
                                        '0',
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        '0',
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 9,
                                        ),
                                      );
                                    }
                                  },
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
                          text: "${producto.nombreEmpresa}\n",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: producto.nombreProducto,
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
              child: (comprador != null)
                  ? SizedBox(
                      width: ancho,
                      height: alto / 1.3,
                      child: CompradorCardDetalleProducto(
                        ancho: ancho,
                        alto: alto,
                        producto: producto,
                        idUsuario: comprador!.idComprador,
                      ),
                    )
                  : const Center(),
            )
          ],
        ),
      ),
    );
  }

  void obtenerPerfil(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comprador) {
      setState(() {
        comprador = response;
      });
    }
    // ignore: use_build_context_synchronously
    context
        .read<CompradorCarritoBloc>()
        .add(EventBotonObtenerCarro(idUsuario: comprador!.idComprador));
  }
}
