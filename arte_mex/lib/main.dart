//import 'package:arte_mex/navbar/navbar_comerciante/navbar_comerciante_route.dart';
import 'package:arte_mex/navbar/navbar_comprador/navbar_comprador_route.dart';
//import 'package:arte_mex/splash_view/splash_init_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arte Mex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF0F0F0),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const NavbarCompradorRoute()
        //const NavbarComercianteRoute(), //const SplashInitPage(),
        );
  }
}
