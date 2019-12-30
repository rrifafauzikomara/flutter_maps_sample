import 'package:flutter/material.dart';
import 'package:flutter_maps_sample/common/common.dart';
import 'package:flutter_maps_sample/common/navigation.dart';
import 'package:flutter_maps_sample/common/sizes.dart';
import 'package:flutter_maps_sample/ui/maps_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _getPermission(context);
  }

  // request permission for location
  void _getPermission(BuildContext context) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([PermissionGroup.location]);

    if (result[PermissionGroup.location] == PermissionStatus.granted) {
      _goToMaps();
    } else if(result[PermissionGroup.location] == PermissionStatus.denied) {
      Common.showAlertDialogPermission(context, "You need accepted permission for access maps");
    }
  }

  void _goToMaps() {
    Navigation.intentWithoutBack(context, MapScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: Sizes.width(context) / 2.5,
          width: Sizes.width(context) / 2.5,
          child: FlutterLogo(
            size: 20,
          ),
        ),
      ),
    );
  }
}
