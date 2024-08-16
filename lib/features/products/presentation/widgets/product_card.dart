import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/button_widget.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/top_card_section.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    super.key, 
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .42,
      height: size.height * .33,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.aspectRatio * 40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [

          TopCardSection( product: product),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                Text(
                  product.weight,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: GreenAppleColors.labelHintTextColor,
                    fontSize: size.aspectRatio * 40,
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.start,
                ),

                Text(
                  product.brand,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: GreenAppleColors.labelBrandColor,
                    fontSize: size.aspectRatio * 40,
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: size.height * .01),

                Row(
                  children: [
                    Text(
                      'S/ ${product.price.toStringAsFixed(2).toString()}',
                      style:TextStyle(
                        color: GreenAppleColors.dark,
                        fontSize: size.aspectRatio * 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: size.width * .05),
                    Text(
                      (product.originalPrice == null) ? '' : 'S/ ${product.originalPrice.toString()}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: GreenAppleColors.labelOriginPriceColor,
                        fontSize: size.aspectRatio * 40,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: size.height * .01),

                const ButtonWidget()

              ],
            ),
          )

        ],
      )

    );
  }

}

