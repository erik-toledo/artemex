// ignore_for_file: unrelated_type_equality_checks

import 'package:arte_mex/caracteristicas/inicio_sesion/presentation/pages/iniciar_sesion_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashInitPage extends StatefulWidget {
  const SplashInitPage({super.key});

  @override
  State<SplashInitPage> createState() => _SplashInitPageState();
}

class _SplashInitPageState extends State<SplashInitPage> {
  List<Map<String, String>> datos = [
    {
      "text": "Descubre",
      "image": "assets/imagenes_carousel/image1.jpg",
      "id": "1"
    },
    {
      "text": "Comparte",
      "image": "assets/imagenes_carousel/image2.jpg",
      "id": "2"
    },
    {
      "text": "Y disfruta la autenticidad",
      "image": "assets/imagenes_carousel/image3.jpg",
      "id": "3"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: content(),
    );
  }

  CarouselSlider content() {
    return CarouselSlider(
      items: datos.map((i) {
        return Stack(fit: StackFit.expand, children: [
          Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            width: double.infinity,
            child: Image.asset(
              i["image"] as String,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.500),
              ),
            ),
          ),
          (int.parse(i["id"].toString()) != 3)
              ? Positioned(
                  left: 150,
                  bottom: 80,
                  child: Text(
                    i["text"] as String,
                    style: GoogleFonts.gaegu(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(152, 152, 152, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              : Positioned(
                  left: 60,
                  bottom: 50,
                  child: Column(
                    children: [
                      Text(
                        i["text"] as String,
                        style: GoogleFonts.gaegu(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(152, 152, 152, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                builder: (context) => const IniciarSesionPage(),
                              );
                              Navigator.pushAndRemoveUntil(
                                  context, route, (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(97, 121, 70, 1),
                            ),
                            child: const Text(
                              'Iniciar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Positioned(
            top: 50,
            left: 40,
            child: Row(
              children: [
                Text(
                  'ARTE',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  width: 20,
                ),
                Text(
                  'M',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(97, 121, 70, 1),
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  'E',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(237, 168, 18, 1),
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  'X',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(206, 49, 119, 1),
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
        ]);
      }).toList(),
      options: CarouselOptions(
        height: 900,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayCurve: Curves.linear,
        autoPlayInterval: const Duration(seconds: 9),
      ),
    );
  }
}
