import 'package:flutter/material.dart';
import 'package:flutter_maps_sample/common/colors.dart';
import 'package:flutter_maps_sample/common/sizes.dart';

class CardBottomSheet extends StatelessWidget {
  final String image,
      restaurantName,
      review,
      currentHasTag,
      totalHasTag,
      location;

  const CardBottomSheet(
      {Key key,
      this.image,
      this.restaurantName,
      this.review,
      this.currentHasTag,
      this.totalHasTag,
      this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.network(
          image,
          height: Sizes.width(context) / 3,
          width: Sizes.width(context),
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: Sizes.dp12(context),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Sizes.dp8(context),
            right: Sizes.dp8(context),
            bottom: Sizes.dp8(context),
          ),
          child: Text(
            restaurantName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: ColorPalette.black,
              fontSize: Sizes.dp22(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Sizes.dp8(context),
            right: Sizes.dp8(context),
            bottom: Sizes.dp8(context),
          ),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.star,
                    color: ColorPalette.amber,
                    size: Sizes.dp20(context),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: ColorPalette.amber,
                    size: Sizes.dp20(context),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: ColorPalette.amber,
                    size: Sizes.dp20(context),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: ColorPalette.amber,
                    size: Sizes.dp20(context),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: ColorPalette.amber,
                    size: Sizes.dp20(context),
                  ),
                ),
                Container(
                  child: Text(
                    review,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.dp16(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Sizes.dp8(context),
            right: Sizes.dp8(context),
            bottom: Sizes.dp8(context),
          ),
          child: Text(
            "#$currentHasTag of $totalHasTag Restaurant in $location",
            style: TextStyle(
              color: Colors.black54,
              fontSize: Sizes.dp16(context),
            ),
          ),
        ),
        SizedBox(
          height: Sizes.dp16(context),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Sizes.dp8(context),
            right: Sizes.dp8(context),
          ),
          child: Container(
            width: Sizes.width(context),
            child: RaisedButton(
              child: Text(
                "More Info",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: ColorPalette.orangeAccent,
              onPressed: () {},
            ),
          ),
        ),
        SizedBox(
          height: Sizes.dp16(context),
        ),
      ],
    );
  }
}
