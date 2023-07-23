import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/direccion.dart';

class CompradorCardDireccion extends StatefulWidget {
  final double ancho;
  final double alto;
  final bool esSeleccionado;
  final Direccion direccion;
  final void Function()? onTap;
  const CompradorCardDireccion({
    super.key,
    required this.ancho,
    required this.alto,
    required this.esSeleccionado,
    required this.onTap,
    required this.direccion,
  });

  @override
  State<CompradorCardDireccion> createState() => _CompradorCardDireccionState();
}

class _CompradorCardDireccionState extends State<CompradorCardDireccion> {
  @override
  Widget build(BuildContext context) {
    Direccion direccion = widget.direccion;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: widget.ancho,
          height: widget.alto / 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFE4E3E3),
              border: (widget.esSeleccionado) ? Border.all(color: Colors.purple) : null),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: widget.ancho / 5,
                  height: widget.alto / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFE4E3E3),
                  ),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: widget.ancho / 1.81,
                  height: widget.alto,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Estado: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            'Chiapas',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Municipio: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            'Suchiapa',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Calle: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          SizedBox(
                            width: widget.ancho / 2.5,
                            child: Text(
                              'Av. Primera Nte. Ote.',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Num. Ext: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            direccion.numExterior,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                          SizedBox(width: widget.ancho / 30),
                          Text(
                            'Num. Int: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            '08',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Codigo postal: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            '29150',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: widget.ancho / 11,
                    height: widget.alto / 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: Colors.purple,
                        size: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.ancho / 11,
                    height: widget.alto / 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_location_outlined,
                        color: Color(0XFFEDA812),
                        size: 25,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
