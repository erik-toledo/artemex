//import 'package:arte_mex/navbar/navbar_comerciante/navbar_comerciante_route.dart';
//import 'package:arte_mex/navbar/navbar_comprador/navbar_comprador_route.dart';
//import 'package:arte_mex/splash_view/splash_init_page.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/bloc/comerciante_historial_bloc.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/bloc/comerciante_pedidos_bloc.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/bloc/comerciante_producto_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/presentation/bloc/comprador_buscar_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/bloc/comprador_carrito_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/comprar/presentation/bloc/comprador_compra_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/bloc/comprador_direccion_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/presentation/bloc/comprador_historial_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/bloc/comprador_inicio_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/presentation/bloc/comprador_seguimiento_bloc.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/presentation/bloc/inicio_sesion_bloc.dart';
import 'package:arte_mex/caracteristicas/registro/presentation/bloc/registro_comerciante/registro_comerciante_bloc.dart';
import 'package:arte_mex/caracteristicas/registro/presentation/bloc/registro_comprador/registro_comprador_bloc.dart';
import 'package:arte_mex/splash_view/splash_init_page.dart';
import 'package:arte_mex/usecase_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

UsecaseConfig config = UsecaseConfig();
Future main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InicioSesionBloc(
              iniciarSesionUsecase: config.iniciarSesionUsecase!,
              informacionUsuarioUsecase:
                  config.inicioSesionObtenerInformacionUsuarioUsecase!),
        ),
        BlocProvider(
          create: (context) => ComercianteProductoBloc(
            actualizarProductoUsecase: config.actualizarProductoUsecase!,
            crearProductoUsecase: config.crearProductoUsecase!,
            eliminarProductoUsecase: config.eliminarProductoUsecase!,
            obtenerProductoUsecase: config.obtenerProductoUsecase!,
            subirImagenUsecase: config.subirImagenUsecase!,
          ),
        ),
        BlocProvider(
          create: (context) => ComerciantePedidosBloc(
            obtenerPedidosUsecase: config.obtenerPedidosUsecase!,
            actualizarEstatusPedidoUsecase:
                config.actualizarEstatusPedidoUsecase!,
          ),
        ),
        BlocProvider(
          create: (context) => ComercianteHistorialBloc(
              obtenerHistorialVentaUsecase:
                  config.comercianteObtenerHistorialVentaUsecase!),
        ),
        BlocProvider(
          create: (context) => CompradorInicioBloc(
              obtenerProductoInicioUsecase:
                  config.compradorObtenerProductoInicioUsecase!,
              categoriaUsecase: config.categoriaUsecase!,
              compradorObtenerCategoriasUsecase:
                  config.compradorObtenerCategoriasUsecase!,
              compradorObtenerCategoriaInicioUsecase:
                  config.compradorObtenerCategoriaInicioUsecase!,
              compradorObtenerEstadoCategoriaUsecase:
                  config.compradorObtenerEstadoCategoriaUsecase!),
        ),
        BlocProvider(
          create: (context) => CompradorHistorialBloc(
              obtenerHistorialCompraUsecase:
                  config.obtenerHistorialCompraUsecase!),
        ),
        BlocProvider(
          create: (context) => CompradorDireccionBloc(
              compradorActualizarDireccionUsecase:
                  config.compradorActualizarDireccionUsecase!,
              compradorCrearDireccionUsecase:
                  config.compradorCrearDireccionUsecase!,
              compradorEliminarDireccionUsecase:
                  config.compradorEliminarDireccionUsecase!,
              compradorObtenerDireccionUsecase:
                  config.compradorObtenerDireccionUsecase!),
        ),
        BlocProvider(
          create: (context) =>
              CompradorCompraBloc(compraUsecase: config.compraUsecase!),
        ),
        BlocProvider(
          create: (context) => CompradorCarritoBloc(
            compradorAgregarProductoCarritoUsecase:
                config.compradorAgregarProductoCarritoUsecase!,
            compradorEliminarProductoCarritoUsecase:
                config.compradorEliminarProductoCarritoUsecase!,
            compradorObtenerCarritoUsecase: config.carritoUsecase!,
          ),
        ),
        BlocProvider(
          create: (context) => CompradorBuscarBloc(
            compradorBusquedaUsease: config.compradorBusquedaUsease!,
          ),
        ),
        BlocProvider(
          create: (context) => CompradorSeguimientoBloc(
            compradorSeguimientoUsecase: config.compradorSeguimientoUsecase!,
          ),
        ),
        BlocProvider(
          create: (context) => RegistroComercianteBloc(
            registroCrearUsuarioComerciante:
                config.registroCrearUsuarioComerciante!,
          ),
        ),
        BlocProvider(
          create: (context) => RegistroCompradorBloc(
            registroCrearUsuarioComprador:
                config.registroCrearUsuarioComprador!,
          ),
        )
      ],
      child: MaterialApp(
          title: 'Arte Mex',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffF0F0F0),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
          home: const SplashInitPage()),
    );
  }
}
