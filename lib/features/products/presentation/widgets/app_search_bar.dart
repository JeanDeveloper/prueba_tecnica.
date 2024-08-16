import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_tecnica/core/theme.dart';

class AppBarSearch extends StatelessWidget {

  final void Function()? ontap;

  const AppBarSearch({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: size.width * .05),
      margin: EdgeInsets.only(
        top: size.height * .1,
        left: size.width * .05,
        right: size.width * .05
      ),
      decoration:  buildDecoration(Colors.white, BorderRadius.circular(16)),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Buscar en Market", 
                style: TextStyle( 
                  fontSize: size.aspectRatio * 45, 
                  color: GreenAppleColors.hintlabelTextColor
                )
              )
            ),
            Container(
              width: size.width * .15, 
              height: double.infinity, 
              decoration: buildDecoration(
                Theme.of(context).primaryColor, 
                const BorderRadius.only(
                  topRight: Radius.circular(16), 
                  bottomRight:  Radius.circular(16)
                )
              ), 
              child: Container(
                padding: EdgeInsets.all(size.aspectRatio * 30),
                child: SvgPicture.asset(
                  'assets/svg/shape.svg',
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Decoration buildDecoration(Color color, BorderRadiusGeometry borderRadius){
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );
  }

}