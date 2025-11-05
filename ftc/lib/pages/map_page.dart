import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' hide PermissionStatus;

import '../db_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(35.012480, -82.121104);
  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);

  LatLng? _currentLocation;

  bool _initCompleted = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();

    // getLocationUpdates().then((value) => {

    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId("_center"),
              icon: BitmapDescriptor.defaultMarker,
              position: _center,
            )
          },
        ),
      ),
    );
  }

  // Future <void> getLocationUpdates() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //
  //   _serviceEnabled = await _locationController.serviceEnabled();
  //   if (_serviceEnabled) {
  //     _serviceEnabled = await _locationController.requestService();
  //   } else {
  //     return;
  //   }
  //
  //   _permissionGranted = await _locationController.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await _locationController.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //
  //   _locationController.onLocationChanged.listen((LocationData currentLocation) {
  //     if (currentLocation.latitude != null && currentLocation.longitude != null) {
  //
  //       _currentLocation = LatLng(
  //         currentLocation.latitude!,
  //         currentLocation.longitude!,
  //       );
  //
  //       DBServices().create(path: 'location_tracker', data: {
  //         'uid': {
  //           'lat': currentLocation.latitude!,
  //           'lng': currentLocation.longitude!
  //         }
  //       });
  //
  //       // setState(() {
  //       //   if (!_initCompleted) {
  //       //     _cameraToPosition(_currentP!);
  //       //   }
  //       // });
  //
  //       // _me.update({
  //       //   'location': {
  //       //     'lat': currentLocation.latitude!,
  //       //     'lng': currentLocation.longitude!,
  //       //   },
  //       // }).then((_) {
  //       //   print('Document successfully updated!');
  //       // }).catchError((err) {
  //       //   print(err);
  //       // });
  //     }
  //   });
  // }
}
