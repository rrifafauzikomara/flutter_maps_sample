import 'package:flutter/material.dart';
import 'package:flutter_maps_sample/common/colors.dart';
import 'package:flutter_maps_sample/common/sizes.dart';

class CardDraggableSheet extends StatelessWidget {
  final String image, restaurantName, review, status, type, distance;

  const CardDraggableSheet(
      {Key key,
      this.image,
      this.restaurantName,
      this.review,
      this.status,
      this.type,
      this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.width(context) / 4,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            image,
            height: Sizes.width(context) / 3,
            width: Sizes.width(context) / 3,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: Sizes.dp10(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurantName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: ColorPalette.black,
                      fontSize: Sizes.dp16(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: ColorPalette.amber,
                        size: Sizes.dp14(context),
                      ),
                      Icon(
                        Icons.star,
                        color: ColorPalette.amber,
                        size: Sizes.dp14(context),
                      ),
                      Icon(
                        Icons.star,
                        color: ColorPalette.amber,
                        size: Sizes.dp14(context),
                      ),
                      Icon(
                        Icons.star,
                        color: ColorPalette.amber,
                        size: Sizes.dp14(context),
                      ),
                      Icon(
                        Icons.star,
                        color: ColorPalette.amber,
                        size: Sizes.dp14(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Sizes.dp4(context),
                          right: Sizes.dp4(context),
                        ),
                        child: Text(
                          review,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: Sizes.dp12(context),
                          ),
                        ),
                      ),
                      Text(
                        "\u00B7",
                        style: TextStyle(
                          color: ColorPalette.red,
                          fontSize: Sizes.dp25(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Sizes.dp4(context),
                          right: Sizes.dp4(context),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: ColorPalette.red,
                            fontSize: Sizes.dp12(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    type,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.dp12(context),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: ColorPalette.grey,
                        size: Sizes.dp14(context),
                      ),
                      Text(
                        distance,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: Sizes.dp14(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
