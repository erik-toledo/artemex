import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/bloc/comerciante_pedidos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ComercianteCardPaqueteria extends StatefulWidget {
  final double ancho;
  final double alto;
  final String empresa;
  final String pagina;
  final Color colorPrimarioLogo;
  final Color colorSecundarioLogo;
  final String rutaLogo;
  final String idPedido;
  final String idVendedor;
  const ComercianteCardPaqueteria(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.empresa,
      required this.pagina,
      required this.colorPrimarioLogo,
      required this.colorSecundarioLogo,
      required this.rutaLogo,
      required this.idPedido,
      required this.idVendedor});

  @override
  State<ComercianteCardPaqueteria> createState() =>
      _ComercianteCardPaqueteriaState();
}

class _ComercianteCardPaqueteriaState extends State<ComercianteCardPaqueteria> {
  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    return Container(
      width: ancho / 1.3,
      height: alto / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffE2E2E2),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.23),
            )
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  widget.rutaLogo,
                  width: 110,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.empresa,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Entrega estimada:  \n2 - 5 dias",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    widget.pagina,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: ancho / 1.5,
            height: alto / 18,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: widget.colorPrimarioLogo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  bool response = await context
                      .read<ComerciantePedidosBloc>()
                      .actualizarEstatusPedido(
                          widget.idPedido, "ENVIADO", widget.empresa);
                  if (response) {
                    // ignore: use_build_context_synchronously
                    context.read<ComerciantePedidosBloc>().add(
                        EventBotonObtenerPedidos(idUsuario: widget.idVendedor));
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Enviar",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: widget.colorSecundarioLogo),
                )),
          )
        ],
      ),
    );
  }
}
