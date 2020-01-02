import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps_sample/common/colors.dart';
import 'package:flutter_maps_sample/common/sizes.dart';
import 'package:flutter_maps_sample/common/string_image_assets.dart';
import 'package:flutter_maps_sample/widget/card_bottom_sheet.dart';
import 'package:flutter_maps_sample/widget/card_draggable_sheet.dart';
import 'package:flutter_maps_sample/widget/card_type_food.dart';
import 'package:flutter_maps_sample/widget/custom_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with SingleTickerProviderStateMixin {

  Completer<GoogleMapController> _controller = Completer();
  LocationData _currentLocation;
  var _location = new Location();
  static LatLng _initialPosition;
  final Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _getCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;

    try {
      _currentLocation = await _location.getLocation();
    } on Exception {
      _currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(_currentLocation.latitude, _currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }

  Future<LatLng> _getStartingLocation() async {
    _currentLocation = await _location.getLocation();
    return LatLng(_currentLocation.latitude, _currentLocation.longitude);
  }

  @override
  void initState() {
    super.initState();
    _getStartingLocation().then((value) {
      setState(() {
        _initialPosition = value;
      });
    });
    _markers.add(
      Marker(
        markerId: MarkerId("37.787314, -122.406072"),
        position: LatLng(37.787314, -122.406072),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => _showModalBottomSheet(),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("37.786576, -122.406126"),
        position: LatLng(37.786576, -122.406126),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => _showModalBottomSheet(),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("37.787475, -122.408100"),
        position: LatLng(37.787475, -122.408100),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => _showModalBottomSheet(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: _initialPosition == null
            ? Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                StringImageAssets.loadingMaps,
              ),
              Text("Loading Maps..."),
            ],
          ),
        )
            : Stack(
          children: <Widget>[
            _googleMaps(),
            _toolbar(),
            _bottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget _googleMaps() {
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      zoomGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 17.0,
      ),
      myLocationButtonEnabled: false,
      markers: _markers,
    );
  }

  Widget _toolbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          blurRadius: 10.0,
          colorBlur: ColorPalette.grey,
          iconData: Icons.arrow_back,
          colorButton: ColorPalette.white,
          sizeButton: Sizes.width(context) / 9,
          sizeIcon: Sizes.width(context) / 18,
          colorIcon: ColorPalette.blue,
          boxShape: BoxShape.circle,
          margin: EdgeInsets.only(
              top: Sizes.dp25(context), left: Sizes.dp12(context)),
          onTap: () {
            //Do something
          },
        ),
        CustomButton(
          blurRadius: 10.0,
          colorBlur: ColorPalette.grey,
          iconData: Icons.my_location,
          colorButton: ColorPalette.white,
          sizeButton: Sizes.width(context) / 9,
          sizeIcon: Sizes.width(context) / 18,
          colorIcon: ColorPalette.blue,
          boxShape: BoxShape.circle,
          margin: EdgeInsets.only(
              top: Sizes.dp25(context), right: Sizes.dp12(context)),
          onTap: _getCurrentLocation,
        ),
      ],
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Container(
            width: Sizes.width(context),
            child: Stack(
              children: <Widget>[
                CardBottomSheet(
                  image: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  restaurantName: "Gramercy Tavern",
                  review: "(672)",
                  currentHasTag: "3,665",
                  totalHasTag: "8,605",
                  location: "Jakarta",
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: Sizes.dp12(context),
                        ),
                        height: 6,
                        width: 50,
                        decoration: BoxDecoration(
                          color: ColorPalette.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomButton(
                          blurRadius: 10.0,
                          colorBlur: ColorPalette.grey,
                          iconData: Icons.close,
                          colorButton: ColorPalette.white,
                          sizeButton: Sizes.width(context) / 12,
                          sizeIcon: Sizes.dp18(context),
                          colorIcon: ColorPalette.blue,
                          boxShape: BoxShape.circle,
                          margin: EdgeInsets.only(
                              left: Sizes.dp12(context)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: Sizes.dp12(context)),
                          child: IconButton(
                            iconSize: Sizes.width(context) / 12,
                            icon: Icon(Icons.favorite_border, color: ColorPalette.white, size: Sizes.width(context) / 12,),
                            onPressed: () {

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }

  Widget _bottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.9,
      builder: (BuildContext context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorPalette.grey,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              Center(
                child: Container(
                  height: 8,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorPalette.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Restaurants Nearby",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.dp20(context),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
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
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              Icons.filter_list,
                              size: Sizes.dp20(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CardFilter(
                      filterName: "Price",
                      onTap: () {},
                    ),
                    CardFilter(
                      filterName: "Breakfast",
                      onTap: () {},
                    ),
                    CardFilter(
                      filterName: "Lunch",
                      onTap: () {},
                    ),
                    CardFilter(
                      filterName: "Dinner",
                      onTap: () {},
                    ),
                    CardFilter(
                      filterName: "Recomended",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              CardDraggableSheet(
               image: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
               restaurantName: "Gramercy Tavern",
               review: "(672)",
               status: "Closed",
               type: "Pizza",
               distance: "1.5 km",
             ),
              Container(
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              CardDraggableSheet(
                image: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                restaurantName: "Gramercy Tavern",
                review: "(672)",
                status: "Closed",
                type: "Pizza",
                distance: "1.5 km",
              ),
              Container(
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              CardDraggableSheet(
                image: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                restaurantName: "Gramercy Tavern",
                review: "(672)",
                status: "Closed",
                type: "Pizza",
                distance: "1.5 km",
              ),
              Container(
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              CardDraggableSheet(
                image: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                restaurantName: "Gramercy Tavern",
                review: "(672)",
                status: "Closed",
                type: "Pizza",
                distance: "1.5 km",
              ),
              Container(
                child: Divider(
                  color: Colors.black45,
                ),
              ),
              CardDraggableSheet(
                image: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                restaurantName: "Gramercy Tavern",
                review: "(672)",
                status: "Closed",
                type: "Pizza",
                distance: "1.5 km",
              ),
            ],
          ),
        );
      },
    );
  }

}