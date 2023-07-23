import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorNuevaDireccionPage extends StatefulWidget {
  const CompradorNuevaDireccionPage({super.key});

  @override
  State<CompradorNuevaDireccionPage> createState() =>
      _CompradorNuevaDireccionPageState();
}

class _CompradorNuevaDireccionPageState
    extends State<CompradorNuevaDireccionPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    final controllerNombre = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: 'Agregar dirección',
            regresar: true,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: alto / 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: ancho / 1.1,
              height: alto / 1.4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre y apellido',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      width: ancho / 1.1,
                      height: alto / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0XFFE4E3E3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: controllerNombre,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none,
                              hintText: 'Kevi Sahib',
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: const Color(0xffC9C9C9),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estado',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Codigo postal',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: ancho / 2.5,
                            height: alto / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0XFFE4E3E3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: controllerNombre,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 10),
                                    border: InputBorder.none,
                                    hintText: 'Chiapas',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: const Color(0xffC9C9C9),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            width: ancho / 2.5,
                            height: alto / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0XFFE4E3E3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: controllerNombre,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 10),
                                    border: InputBorder.none,
                                    hintText: '29000',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: const Color(0xffC9C9C9),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Municipio',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      width: ancho / 1.1,
                      height: alto / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0XFFE4E3E3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: controllerNombre,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none,
                              hintText: 'Suchiapa',
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: const Color(0xffC9C9C9),
                              )),
                        ),
                      ),
                    ),
                    Text(
                      'Calle',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      width: ancho / 1.1,
                      height: alto / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0XFFE4E3E3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: controllerNombre,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none,
                              hintText: 'Av. Septima poniente',
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: const Color(0xffC9C9C9),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Num. Exterior',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Num. Interior',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: ancho / 2.5,
                            height: alto / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0XFFE4E3E3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: controllerNombre,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 10),
                                    border: InputBorder.none,
                                    hintText: '808',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: const Color(0xffC9C9C9),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            width: ancho / 2.5,
                            height: alto / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0XFFE4E3E3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: controllerNombre,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 10),
                                    border: InputBorder.none,
                                    hintText: '1',
                                    hintStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: const Color(0xffC9C9C9),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Número de contacto',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      width: ancho / 1.1,
                      height: alto / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0XFFE4E3E3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: controllerNombre,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 10),
                              border: InputBorder.none,
                              hintText: '9663234455',
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                color: const Color(0xffC9C9C9),
                              )),
                        ),
                      ),
                    ),
                    Text(
                      'Descripción del domicilio',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: ancho / 1.1,
                        height: alto / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0XFFE4E3E3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: controllerNombre,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 10),
                                border: InputBorder.none,
                                hintText: 'Casa verde con portón blanco',
                                hintStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: const Color(0xffC9C9C9),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: alto / 20),
          SizedBox(
            width: ancho / 1.05,
            height: alto / 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
              onPressed: () {},
              child: Text(
                'Guardar direaccion',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
