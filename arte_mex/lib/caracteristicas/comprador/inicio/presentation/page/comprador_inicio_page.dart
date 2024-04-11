// ignore_for_file: deprecated_member_use

import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/pages/comprador_carro_compra_page.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/bloc/comprador_inicio_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/widgets/card_producto_item.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/comprador_inicio_estado_page.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../../carrito/presentation/bloc/comprador_carrito_bloc.dart';

class CompradorInicioPage extends StatefulWidget {
  const CompradorInicioPage({super.key});

  @override
  State<CompradorInicioPage> createState() => _CompradorInicioPageState();
}

class _CompradorInicioPageState extends State<CompradorInicioPage> {
  Comprador? comprador;
  @override
  void initState() {
    obtenerPerfil(context);
    super.initState();
  }

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
                    color: Colors.white),
              ),
              Text(
                'M',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: const Color.fromRGBO(97, 121, 70, 1)),
              ),
              Text(
                'E',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: const Color.fromRGBO(234, 168, 18, 1)),
              ),
              Text(
                'X',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: const Color.fromRGBO(206, 49, 119, 1)),
              ),
            ],
          ),
        ),
      ),
      //ciculos estados
      body: Column(
        children: [
          SizedBox(
            width: ancho / 1.1,
            height: alto / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => const CompradorCarroCompraPage(),
                    );
                    Navigator.push(context, route);
                  },
                  child: SizedBox(
                    width: ancho / 7,
                    height: alto / 10,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 32,
                          top: 21.5,
                          child: BlocBuilder<CompradorCarritoBloc,
                              CompradorCarritoState>(
                            builder: (context, state) {
                              if (state is CompradorObteniendoCarritoState) {
                                return Text("...",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 9,
                                    ));
                              } else if (state
                                  is CompradorCarritoObtenidoState) {
                                return Text(
                                  state.carro.length.toString(),
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontSize: 9,
                                  ),
                                );
                              } else if (state is CompradorCarritoError) {
                                return Center(
                                  child: Text(state.error),
                                );
                              } else {
                                return Text("0",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 9,
                                    ));
                              }
                            },
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 15,
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_comerciante/carrito.svg',
                            width: 40,
                            color: const Color.fromRGBO(97, 121, 70, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ancho,
            height: alto / 6,
            alignment: Alignment.center,
            child: SizedBox(
              width: ancho / 1.1,
              height: alto / 6,
              child: Column(
                children: [
                  SizedBox(
                    height: alto / 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                              builder: (context) =>
                                  const CompradorInicioEstadoPage(
                                tituloEstado: "Chiapas",
                                colorLetraEstado: Color(0xff617946),
                              ),
                            );
                            Navigator.push(context, route);
                          },
                          borderRadius: BorderRadius.circular(40),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color(0xffADDFAC),
                            child: Text(
                              "CHP",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                              builder: (context) =>
                                  const CompradorInicioEstadoPage(
                                tituloEstado: "Oaxaca",
                                colorLetraEstado: Color(0xffCE3177),
                              ),
                            );
                            Navigator.push(context, route);
                          },
                          borderRadius: BorderRadius.circular(40),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color(0xffB09ADA),
                            child: Text(
                              'OAX',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                              builder: (context) =>
                                  const CompradorInicioEstadoPage(
                                tituloEstado: "Yucatan",
                                colorLetraEstado: Color(0xffEDA812),
                              ),
                            );
                            Navigator.push(context, route);
                          },
                          borderRadius: BorderRadius.circular(40),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color(0xffFCD1F4),
                            child: Text(
                              'YUC',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ancho / 1.1,
                    height: alto / 24.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 7),
                          width: ancho / 3.3,
                          child: Text(
                            'Chiapas',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: const Color.fromRGBO(97, 121, 70, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ancho / 3.3,
                          child: Text('Oaxaca',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: const Color.fromRGBO(97, 121, 70, 1),
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          width: ancho / 3.3,
                          child: Text('Yucatan',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: const Color.fromRGBO(97, 121, 70, 1),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: alto / 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'Algunos productos',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: Colors.purple,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                  width: ancho / 1.1,
                  height: alto / 2.3,
                  child: BlocBuilder<CompradorInicioBloc, CompradorInicioState>(
                    builder: (context, state) {
                      if (state is CompradorInicioObteniendoArticulosState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state
                          is CompradorInicioArticulosObtenidosState) {
                        return GridView.builder(
                          itemCount: state.productos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.5,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return CardProductoItem(
                              ancho: ancho,
                              alto: alto,
                              producto: state.productos[index],
                            );
                          },
                        );
                      } else if (state is CompradorInicioCategoriaErrorState) {
                        return Center(
                          child: Text(state.error),
                        );
                      } else {
                        return const Center();
                      }
                    },
                  )),
            ],
          )
        ],
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
    context.read<CompradorInicioBloc>().add(EventBotonObtenerArticulos());
    // ignore: use_build_context_synchronously
    context
        .read<CompradorCarritoBloc>()
        .add(EventBotonObtenerCarro(idUsuario: comprador!.idComprador));
  }
}
