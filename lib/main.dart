import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/di.dart';
import 'package:prueba_tecnica/features/products/presentation/blocs/product/product_bloc.dart';
import 'package:prueba_tecnica/features/products/presentation/screens/splash/splash_screen.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => GetIt.instance.get<ProductBloc>()),
      ], 
      child: MaterialApp(
        title: 'Manzana Verde',
        debugShowCheckedModeBanner: false,
        theme: GreenAppleTheme.theme,
        home: const SplashScreen(),
      ),
    );
  }
}
