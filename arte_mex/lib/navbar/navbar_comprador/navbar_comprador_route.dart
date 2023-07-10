import 'package:arte_mex/navbar/navbar_comprador/navbar_comprador.dart';
import 'package:arte_mex/navbar/navbar_comprador/route_navbar_comprador.dart';
import 'package:flutter/material.dart';

class NavbarCompradorRoute extends StatefulWidget {
  const NavbarCompradorRoute({super.key});

  @override
  State<NavbarCompradorRoute> createState() => _NavbarCompradorRouteState();
}

class _NavbarCompradorRouteState extends State<NavbarCompradorRoute> {
  int index = 1;
  NavbarComprador? navbarComprador;

  @override
  void initState() {
    navbarComprador = NavbarComprador(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbarComprador,
      body: RouterNavbarComprador(index: index),
    );
  }
}
