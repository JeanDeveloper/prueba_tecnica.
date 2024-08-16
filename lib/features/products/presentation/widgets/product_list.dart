import 'package:flutter/material.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/product_card.dart';

class ProductList extends StatelessWidget {

  final List<Product> productList;

  const ProductList({
    super.key, 
    required this.productList
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
      padding: EdgeInsets.symmetric( horizontal: size.width * .05, vertical: size.height * .03 ),
        itemCount: productList.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: size.height * .33,
        ),
        itemBuilder:(context, index) {
          final product = productList[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}