import 'package:arte_mex/navbar/navbar_comerciante/navbar_comerciante.dart';
import 'package:arte_mex/navbar/navbar_comerciante/route_navbar_comerciante.dart';
import 'package:flutter/material.dart';

class NavbarComercianteRoute extends StatefulWidget {
  const NavbarComercianteRoute({super.key});

  @override
  State<NavbarComercianteRoute> createState() => _NavbarComercianteRouteState();
}

class _NavbarComercianteRouteState extends State<NavbarComercianteRoute> {
  int index = 0;
  NavbarComerciante? navbarComerciante;

  @override
  void initState() {
    navbarComerciante = NavbarComerciante(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbarComerciante,
      body: RouterNavbarComerciante(index: index),
    );
  }
}
