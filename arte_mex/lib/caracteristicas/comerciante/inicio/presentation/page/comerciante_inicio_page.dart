// ignore_for_file: use_build_context_synchronously

import 'package:arte_mex/caracteristicas/comerciante/inicio/presentation/page/widgets/comerciante_card.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../inicio_sesion/presentation/bloc/inicio_sesion_bloc.dart';
import '../../../pedidos/presentation/bloc/comerciante_pedidos_bloc.dart';

class ComercianteInicioPage extends StatefulWidget {
  const ComercianteInicioPage({super.key});

  @override
  State<ComercianteInicioPage> createState() => _ComercianteInicioPageState();
}

class _ComercianteInicioPageState extends State<ComercianteInicioPage> {
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
                SizedBox(
                  width: ancho / 2,
                  child: Text(
                    (comerciante != null)
                        ? comerciante!.nombreEmpresa
                        : "Empresa",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
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
                  'Alguno de tus pedidos',
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
            child: BlocBuilder<ComerciantePedidosBloc, ComerciantePedidosState>(
              builder: (context, state) {
                if (state is ComercianteObteniendoPedidosState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                } else if (state is ComerciantePedidosObtenidosState) {
                  return (state.pedidos.isNotEmpty)
                      ? GridView.builder(
                          itemCount: state.pedidos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            childAspectRatio: 3 / 6,
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) {
                            return cardTipoLarga(ancho / 1.2, alto / 2.5,
                                context, state.pedidos[index]);
                          },
                        )
                      : Center(
                          child: Text(
                            "No hay pedidos para mostrar",
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                } else if (state is ComercianteErrorPedidosState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return const Center();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void extraerDatos() async {
    Object response =
        await context.read<InicioSesionBloc>().obtenerInformacionUsuario();
    if (response is Comerciante) {
      setState(() {
        comerciante = response;
      });
    }
    context
        .read<ComerciantePedidosBloc>()
        .add(EventBotonObtenerPedidos(idUsuario: comerciante!.idVendedor));
  }
}
