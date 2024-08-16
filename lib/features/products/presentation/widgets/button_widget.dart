import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/features/products/presentation/widgets/custom_icon_button.dart';

class ButtonWidget extends StatefulWidget {

  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (count != 0) 
        ? null 
        : (){
          setState(() {
            count += 1;
          });
        },
      child: Container(
        width: double.infinity,
        height: size.height * .045,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.aspectRatio * 80),
          color: GreenAppleColors.buttonColor,
        ),
        alignment: Alignment.center,
        child: (count == 0)
          ? Text(
            "Agregar", 
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          )
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icons.remove,
                onPressed: () {
                  setState(() {
                    count -= 1;
                  });
                },
              ),
              Text(
                "$count", 
                style: TextStyle(
                  fontSize: size.aspectRatio * 60, 
                  fontWeight: FontWeight.bold, 
                  color: GreenAppleColors.white
                )
              ),
              CustomIconButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() {
                    count += 1;
                  });
                },
              ),
            ],
          )
      ),
    );
  }

}