import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Color colorButton, colorIcon, colorBlur;
  final double sizeButton, sizeIcon;
  final BoxShape boxShape;
  final double blurRadius;
  final EdgeInsetsGeometry margin;

  CustomButton(
      {Key key,
        @required this.onTap,
        this.iconData,
        this.colorButton,
        this.colorIcon,
        @required this.colorBlur,
        this.sizeButton,
        this.sizeIcon,
        this.boxShape,
        @required this.blurRadius,
        this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: sizeButton,
        height: sizeButton,
        decoration: BoxDecoration(
          color: colorButton,
          shape: boxShape,
          boxShadow: [
            BoxShadow(
              color: colorBlur,
              blurRadius: blurRadius,
            ),
          ],
        ),
        child: Icon(
          iconData,
          color: colorIcon,
          size: sizeIcon,
        ),
      ),
    );
  }
}