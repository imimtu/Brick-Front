import 'package:brick/src/app/styles/ddl/ddl.dart';
import 'package:flutter/material.dart';

class ElevatedIconButton extends IconButton {
  final EdgeInsetsGeometry? outerPadding;
  final Color? backgroundColor;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final double raius;

  const ElevatedIconButton({
    super.key,
    this.outerPadding,
    this.backgroundColor = BrickColors.black,
    this.decoration,
    this.width,
    this.height,
    this.raius = BrickSize.radius / 2,

    /// [IconButton] properties.
    required super.onPressed,
    required super.icon,
    super.alignment,
    super.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: padding,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              raius,
            ),
          ),
        ),
      ),
      width: width,
      height: height,
      child: super.build(context),
    );
  }
}
