import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/comprador_detalle_producto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProducto extends StatefulWidget {
  final double ancho;
  final double alto;
  final ObtenerProducto producto;
  const CardProducto(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.producto});

  @override
  State<CardProducto> createState() => _CardProductoState();
}

class _CardProductoState extends State<CardProducto> {
  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    ObtenerProducto producto = widget.producto;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) => CompradorDetalleProducto(producto: producto),
          );
          Navigator.push(context, route);
        },
        child: Container(
          width: ancho,
          height: alto / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffD9D9D9),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: ancho / 3,
                  height: alto / 6,
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
                    imageUrl: producto.image,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
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
                            width: ancho / 2.5,
                            child: Text(
                              producto.nombreEmpresa,
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
                            width: ancho / 3.4,
                            child: Text(
                              producto.estado,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: ancho / 3.4,
                          child: Text(
                            producto.descripcionProducto,
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
                              producto.cantidad,
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
                            '${producto.precio}.00',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
