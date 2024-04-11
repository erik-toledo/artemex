// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/bloc/comerciante_producto_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/entities/categoria.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../comprador/inicio/presentation/bloc/comprador_inicio_bloc.dart';
import '../../../../inicio_sesion/presentation/bloc/inicio_sesion_bloc.dart';

class ComercianteRegistroProductoPage extends StatefulWidget {
  final String id;
  final List<Categoria> categorias;
  final ObtenerProducto? obtenerProducto;
  const ComercianteRegistroProductoPage(
      {super.key,
      required this.id,
      required this.categorias,
      required this.obtenerProducto});

  @override
  State<ComercianteRegistroProductoPage> createState() =>
      _ComercianteRegistroProductoPageState();
}

class _ComercianteRegistroProductoPageState
    extends State<ComercianteRegistroProductoPage> {
  Comerciante? comerciante;
  List<DropdownMenuItem<String>> dropDownMenuItems = [];
  String categoria = "";
  final controllerNombre = TextEditingController();
  final controllerEstado = TextEditingController();
  final controllerPrecio = TextEditingController();
  final controllerCantidad = TextEditingController();
  final controllerDescripcionProducto = TextEditingController();
  final controllerDescripcionProverdor = TextEditingController();
  @override
  void initState() {
    if (widget.obtenerProducto != null) {
      actualizarText(widget.obtenerProducto!);
    }
    extraerDatos();
    dropDownMenuItems = getDropDownMenuItems();
    categoria = dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];

    for (Categoria element in widget.categorias) {
      items.add(DropdownMenuItem(
          value: element.categoria, child: Text(element.categoria)));
    }
    return items;
  }

  void changedDropDownItem(String? selectedCity) async {
    setState(() {
      categoria = selectedCity!;
    });
    String estadoResponse = await context
        .read<CompradorInicioBloc>()
        .obtenerEstadoCategoria(selectedCity!);
    setState(() {
      controllerEstado.text = estadoResponse;
    });
  }

  final ImagePicker _imagePicker = ImagePicker();
  bool cargando = false;
  bool imageCarga = true;
  String? idVendedor;
  String? imageRutaLocal;
  String? imageRutaDb;
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
              ancho: ancho,
              alto: alto,
              titulo: 'Registro de productos',
              regresar: true),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                width: ancho / 1.2,
                height: alto / 1.23,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: inputText(
                          "Nombre del producto",
                          ancho,
                          alto / 10,
                          controllerNombre,
                          true,
                        ),
                      ),
                      inputText(
                        "Estado",
                        ancho,
                        alto / 10,
                        controllerEstado,
                        false,
                      ),
                      Row(
                        children: [
                          inputText(
                            "Precio",
                            ancho / 3,
                            alto / 10,
                            controllerPrecio,
                            true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: inputText(
                              "Cantidad",
                              ancho / 2.4,
                              alto / 10,
                              controllerCantidad,
                              true,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(228, 227, 227, 1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: ancho / 4.5,
                              child: Text(
                                "Categoria: ",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: categoria,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: const Color(0xffDADADA),
                                items: dropDownMenuItems,
                                onChanged: changedDropDownItem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      inputTextLarge(
                        "Descripción del producto",
                        ancho,
                        alto / 6,
                        controllerDescripcionProducto,
                      ),
                      inputTextLarge(
                        "Descripción del proovedor",
                        ancho,
                        alto / 6,
                        controllerDescripcionProverdor,
                      ),
                      images(
                        "Imagenes del producto",
                        ancho,
                        alto / 6,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  width: ancho / 1.1,
                  height: alto / 15,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: (widget.obtenerProducto == null)
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: (imageRutaLocal != null &&
                                  verificarCampos() &&
                                  imageRutaDb != null)
                              ? () async {
                                  if (comerciante != null) {
                                    setState(() {
                                      cargando = !cargando;
                                    });
                                    if (await crearProducto(context)) {
                                      setState(() {
                                        cargando = !cargando;
                                      });
                                      context
                                          .read<ComercianteProductoBloc>()
                                          .add(EventBotonObtenerProducto(
                                              idUsuario: widget.id));
                                      Navigator.pop(context);
                                    }
                                  }
                                }
                              : null,
                          child: (cargando)
                              ? const CircularProgressIndicator(
                                  color: Color(0xffFFBF35),
                                )
                              : Text(
                                  'Registrar',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        )
                      : actualizar(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputText(String titulo, double ancho, double alto,
      TextEditingController controller, bool enable) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                titulo,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            width: ancho,
            height: alto / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(228, 227, 227, 1),
            ),
            child: TextField(
              controller: controller,
              enabled: enable,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }

  Widget inputTextLarge(String titulo, double ancho, double alto,
      TextEditingController controller) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                titulo,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            width: ancho,
            height: alto / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(228, 227, 227, 1),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }

  Widget images(
    String titulo,
    double ancho,
    double alto,
  ) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: (!imageCarga)
                      ? Container(
                          width: ancho / 3,
                          height: alto / 1.2,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: (imageRutaLocal != null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    File(imageRutaLocal!),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : (imageCarga)
                                  ? null
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                        )
                      : Container(
                          width: ancho / 3,
                          height: alto / 1.2,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: (widget.obtenerProducto != null)
                              ? CachedNetworkImage(
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),
                                  imageUrl: widget.obtenerProducto!.image,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                )
                              : const Center(),
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void getImage() async {
    XFile? xFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    setState(() {
      imageCarga = !imageCarga;
    });
    if (xFile != null) {
      String ruta = await context
          .read<ComercianteProductoBloc>()
          .subirImagen(File(xFile.path));
      setState(() {
        imageRutaLocal = xFile.path;
        imageRutaDb = ruta;
      });
      debugPrint(ruta);
    } else {
      debugPrint('No se seleccionó ninguna imagen.');
    }
  }

  bool verificarCampos() {
    if (controllerCantidad.text.isNotEmpty &&
        controllerNombre.text.isNotEmpty &&
        controllerEstado.text.isNotEmpty &&
        controllerPrecio.text.isNotEmpty &&
        controllerDescripcionProducto.text.isNotEmpty &&
        controllerDescripcionProverdor.text.isNotEmpty) return true;
    return false;
  }

  Future<bool> crearProducto(BuildContext context) async {
    if (comerciante != null) {
      Producto producto = Producto(
        nombreEmpresa: comerciante!.nombreEmpresa,
        categoria: categoria,
        idVendedor: comerciante!.idVendedor,
        nombreProducto: controllerNombre.text,
        estado: controllerEstado.text,
        precio: controllerPrecio.text,
        cantidad: controllerCantidad.text,
        descripcionProducto: controllerDescripcionProducto.text,
        descripcionProveedor: controllerDescripcionProverdor.text,
        image: imageRutaDb!,
        estatus: "APROBADO",
      );
      bool response =
          await context.read<ComercianteProductoBloc>().crearProducto(producto);
      return response;
    }
    return false;
  }

  void extraerDatos() async {
    Object response =
        await context.read<InicioSesionBloc>().obtenerInformacionUsuario();

    if (response is Comerciante) {
      setState(() {
        comerciante = response;
      });
    }
  }

  void actualizarText(ObtenerProducto obtenerProducto) {
    setState(() {
      controllerNombre.text = obtenerProducto.nombreProducto;
      controllerEstado.text = obtenerProducto.estado;
      controllerPrecio.text = obtenerProducto.precio;
      controllerCantidad.text = obtenerProducto.cantidad;
      controllerDescripcionProducto.text = obtenerProducto.descripcionProducto;
      controllerDescripcionProverdor.text =
          obtenerProducto.descripcionProveedor;
    });
  }

  Future<bool> actualizarProducto() async {
    if (comerciante != null && widget.obtenerProducto != null) {
      Producto producto = Producto(
        nombreEmpresa: comerciante!.nombreEmpresa,
        categoria: categoria,
        idVendedor: comerciante!.idVendedor,
        nombreProducto: controllerNombre.text,
        estado: controllerEstado.text,
        precio: controllerPrecio.text,
        cantidad: controllerCantidad.text,
        descripcionProducto: controllerDescripcionProducto.text,
        descripcionProveedor: controllerDescripcionProverdor.text,
        image: (imageRutaDb != null)
            ? imageRutaDb!
            : widget.obtenerProducto!.image,
        estatus: "APROBADO",
      );
      bool response = await context
          .read<ComercianteProductoBloc>()
          .actualizarProducto(widget.obtenerProducto!.idProducto, producto);
      return response;
    }
    return false;
  }

  ElevatedButton actualizar() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: (verificarCampos())
          ? () async {
              if (comerciante != null) {
                setState(() {
                  cargando = !cargando;
                });
                if (await actualizarProducto()) {
                  setState(() {
                    cargando = !cargando;
                  });
                  context
                      .read<ComercianteProductoBloc>()
                      .add(EventBotonObtenerProducto(idUsuario: widget.id));
                  Navigator.pop(context);
                }
              }
            }
          : null,
      child: (cargando)
          ? const CircularProgressIndicator(
              color: Color(0xffFFBF35),
            )
          : Text(
              'Actualizar',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
    );
  }
}
