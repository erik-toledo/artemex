import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/page/comerciante_pedidos_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../pedidos/domain/entities/pedido.dart';

Widget cardTipoLarga(
    double ancho, double alto, BuildContext context, Pedido pedido) {
  return InkWell(
    onTap: () {
      Route route = MaterialPageRoute(
        builder: (context) => const ComerciantePedidosPage(),
      );
      Navigator.push(context, route);
    },
    child: Container(
      width: ancho / 2.8,
      height: alto / 1.55,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Container(
              width: ancho / 3.5,
              height: alto / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
                imageUrl: pedido.image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  pedido.nombreProducto,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Cantidad: ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 7,
                      ),
                    ),
                    Text(
                      pedido.cantidad,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 7,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/imagenes_iconos_card/destino.svg',
                      width: 7,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: ancho / 4,
                      child: Text(
                        pedido.ubicacion,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 6,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  'Total:',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 7,
                  ),
                ),
                Text(
                  '${pedido.total}.00',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.purple,
                      shadows: <BoxShadow>[
                        const BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 9,
                          color: Color.fromRGBO(0, 0, 0, 0.200),
                        )
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (context) => const ComerciantePedidosPage(),
                );
                Navigator.push(context, route);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/imagenes_iconos_card/ver.svg',
                        width: 15,
                        colorFilter: const ColorFilter.mode(
                            Colors.purple, BlendMode.srcIn),
                      ),
                      Text(
                        'Mas detalles',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 4,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
