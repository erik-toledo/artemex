import 'package:arte_mex/caracteristicas/comprador/historial/domain/entities/comprador_historial_compra.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_detalle_historial.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorCardCompra extends StatefulWidget {
  final double ancho;
  final double alto;
  final CompradorHistorialCompra historialCompra;
  const CompradorCardCompra(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.historialCompra});

  @override
  State<CompradorCardCompra> createState() => _CompradorCardCompraState();
}

class _CompradorCardCompraState extends State<CompradorCardCompra> {
  @override
  Widget build(BuildContext context) {
    CompradorHistorialCompra historialCompra = widget.historialCompra;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) =>
                ReutilizableWidgetDetalleHistorial(compra: historialCompra),
          );
          Navigator.push(context, route);
        },
        child: Container(
          height: widget.alto / 4.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0XFFD9D9D9),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: widget.ancho / 3,
                  height: widget.alto / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                  ),
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
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
                    imageUrl: historialCompra.image,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/tienda.svg',
                            width: 10,
                          ),
                        ),
                        SizedBox(
                          width: widget.ancho / 2.65,
                          child: Text(
                            historialCompra.nombreEmpresa,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/verificado.svg',
                            width: 10,
                            colorFilter: const ColorFilter.mode(
                                Color(0XFF1D9BF0), BlendMode.srcIn),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/ubicacion.svg',
                            width: 10,
                          ),
                        ),
                        SizedBox(
                          width: widget.ancho / 3,
                          child: Text(
                            historialCompra.ubicacion,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: widget.ancho / 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          historialCompra.descripcionProducto,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Cantidad: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            historialCompra.cantidad,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4, top: 2),
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/precio.svg',
                            width: 10,
                          ),
                        ),
                        Text(
                          '${historialCompra.precio}.00',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Fecha de compra: ${historialCompra.fechaCompra}',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 5,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
