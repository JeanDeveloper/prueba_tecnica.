import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/app_search_bar.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final products = [
      Product(id: 1, name: "Almendra Cubierta en Chocolate - Gozana", brand: "Gozana", weight: "12 gr", price: 15, originalPrice: 19, onSale: true, image: "https://api-flutter-demo.onrender.com/almendra-cubierta.png"),
      Product(id: 2, name: "Garbanzos Horneados Ajo y Cebolla - Gozana", brand: "Gozana Snacks", weight: "90 gr", price: 11, onSale: false, image: "https://api-flutter-demo.onrender.com/garbanzos.jpeg"),
      Product(id: 1, name: "Almendra Cubierta en Chocolate - Gozana", brand: "Gozana", weight: "12 gr", price: 15, originalPrice: 19, onSale: true, image: "https://api-flutter-demo.onrender.com/almendra-cubierta.png"),
      Product(id: 2, name: "Garbanzos Horneados Ajo y Cebolla - Gozana", brand: "Gozana Snacks", weight: "90 gr", price: 11, onSale: false, image: "https://api-flutter-demo.onrender.com/garbanzos.jpeg"),
      Product(id: 1, name: "Almendra Cubierta en Chocolate - Gozana", brand: "Gozana", weight: "12 gr", price: 15, originalPrice: 19, onSale: true, image: "https://api-flutter-demo.onrender.com/almendra-cubierta.png"),
      Product(id: 2, name: "Garbanzos Horneados Ajo y Cebolla - Gozana", brand: "Gozana Snacks", weight: "90 gr", price: 11, onSale: false, image: "https://api-flutter-demo.onrender.com/garbanzos.jpeg"),
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: size.height * .03),
            color: GreenAppleColors.topBarBackgroundColor,
            width: double.infinity,
            height: size.height * .15,
            child: FadeInRight(
              child: AppBarSearch(
                ontap: () {},
              ),
            ),
          ),

          ProductList(productList: products)

        ],
      ),
    
    );

  }

}
