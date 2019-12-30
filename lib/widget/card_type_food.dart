import 'package:flutter/material.dart';
import 'package:flutter_maps_sample/common/colors.dart';
import 'package:flutter_maps_sample/common/sizes.dart';

class CardFilter extends StatelessWidget {

  final String filterName;
  final GestureTapCallback onTap;

  const CardFilter({Key key, this.filterName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.white,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              filterName,
              style: TextStyle(
                fontSize: Sizes.dp16(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
