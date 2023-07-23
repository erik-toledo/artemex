import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/widgets/comprador_elemento_categoria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorInicioEstadoPage extends StatefulWidget {
  final String tituloEstado;
  final Color colorLetraEstado;
  const CompradorInicioEstadoPage(
      {super.key, required this.tituloEstado, required this.colorLetraEstado});

  @override
  State<CompradorInicioEstadoPage> createState() =>
      _CompradorInicioEstadoPageState();
}

class _CompradorInicioEstadoPageState extends State<CompradorInicioEstadoPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 13, 211, 1),
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.tituloEstado,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: widget.colorLetraEstado,
                      shadows: [
                        const BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 8,
                            color: Color.fromRGBO(0, 0, 0, 0.25))
                      ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Categorias',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xffB4B4B4),
              ),
            ),
          ),
          SizedBox(height: alto / 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: ancho,
              height: alto / 1.6,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
                children: List.generate(30, (index) {
                  return CompradorElementoCategoria(
                    ancho: ancho,
                    alto: alto,
                    categoria: "Aretes",
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
