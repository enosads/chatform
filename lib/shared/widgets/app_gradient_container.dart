import 'package:chatform/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradientContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final List<Color>? colors;

  const AppGradientContainer({
    Key? key,
    this.child,
    this.width,
    this.colors,
    this.borderRadius,
    this.height,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ??
              [
                AppColors.primaryPalette.shade500,
                AppColors.secondaryPalette.shade500,
              ],
          stops: const [0.5, 1.0],
        ),
        shape: shape,
        borderRadius: borderRadius,
      ),
    );
  }
}
