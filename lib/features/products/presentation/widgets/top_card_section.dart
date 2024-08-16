import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/features/products/domain/entities/product.dart';

class TopCardSection extends StatelessWidget {
  const TopCardSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children:[

        Container(
          height: size.height * .1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(size.aspectRatio * 40) , 
              topRight: Radius.circular(size.aspectRatio * 40) 
            ),
            image:DecorationImage(
              image: NetworkImage(
                product.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        if( product.onSale )
          Positioned(
            bottom: size.height * .07,
            left: size.width * .01,
            child: Container(
              width: size.width * .22,
              height: size.height * .025,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.aspectRatio * 80),
                color: GreenAppleColors.buttonColor,
              ),
              alignment: Alignment.center,
              child:  Text(
                "En oferta",
                style: TextStyle(
                  color: GreenAppleColors.white,
                  fontSize: size.aspectRatio * 37
                ),
              ),
            ),
          ),

      ] 
    );
  }
}