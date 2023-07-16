import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ReutilizableWidgetAppbar extends StatefulWidget {
  final double ancho;
  final double alto;
  final String titulo;
  final bool regresar;
  const ReutilizableWidgetAppbar({
    super.key,
    required this.ancho,
    required this.alto,
    required this.titulo,
    required this.regresar,
  });

  @override
  State<ReutilizableWidgetAppbar> createState() =>
      _ReutilizableWidgetAppbarState();
}

class _ReutilizableWidgetAppbarState extends State<ReutilizableWidgetAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.ancho,
      height: widget.alto / 8.35,
      color: Colors.purple,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: widget.ancho / 4,
            height: widget.alto,
            child: (widget.regresar)
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          SizedBox(
            width: widget.ancho / 1.7,
            height: widget.alto,
            child: Column(
              children: [
                SizedBox(
                  width: widget.ancho / 1.25,
                  height: widget.alto / 17,
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
                          fontSize: 28,
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
                Container(
                  width: widget.ancho,
                  height: widget.alto / 53.5,
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.titulo,
                        style: GoogleFonts.montserrat(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
