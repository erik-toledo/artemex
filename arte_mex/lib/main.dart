import 'package:arte_mex/navbar/navbar_comerciante/navbar_comerciante_route.dart';
//import 'package:arte_mex/navbar/navbar_comprador/navbar_comprador_route.dart';
//import 'package:arte_mex/splash_view/splash_init_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home:
          const NavbarComercianteRoute(), //const NavbarCompradorRoute() //const SplashInitPage(),
    );
  }
}
