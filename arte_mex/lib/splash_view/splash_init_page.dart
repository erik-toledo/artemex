// ignore_for_file: unrelated_type_equality_checks

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
      "image": "assets/images_carousel/image1.jpg",
      "id": "1"
    },
    {
      "text": "Comparte",
      "image": "assets/images_carousel/image2.jpg",
      "id": "2"
    },
    {
      "text": "Y disfruta la autenticidad",
      "image": "assets/images_carousel/image3.jpg",
      "id": "3"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(data: datos),
    );
  }

  Widget content({required List<Map<String, String>> data}) {
    return CarouselSlider(
      items: data.map((i) {
        return Stack(fit: StackFit.expand, children: [
          Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            width: double.infinity,
            child: Image(
              image: AssetImage(i["image"] as String),
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
                  left: 170,
                  bottom: 110,
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
                  left: 90,
                  bottom: 60,
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
                            onPressed: () {},
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
            left: 70,
            child: Row(
              children: [
                Text(
                  'ARTE',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
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
                        fontSize: 48,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  'E',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(237, 168, 18, 1),
                        fontSize: 48,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  'X',
                  style: GoogleFonts.simonetta(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(206, 49, 119, 1),
                        fontSize: 48,
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
