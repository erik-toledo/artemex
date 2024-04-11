import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void bloquearCapturaPantalla() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
