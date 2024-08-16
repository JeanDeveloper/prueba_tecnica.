import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/theme.dart';

class CustomIconButton extends StatelessWidget {


  final IconData? icon;
  final void Function()? onPressed;


  const CustomIconButton({
    super.key, 
    this.icon, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IconButton.filled(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(GreenAppleColors.white)
      ),
      onPressed: onPressed, 
      icon:  Icon(
        icon, 
        color: GreenAppleColors.iconButtonColor,
        size: size.aspectRatio * 50,
      ),
    );
  }
}