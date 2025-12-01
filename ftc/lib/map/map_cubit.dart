import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCubit extends Cubit<LatLng> {
  // Constructor: get initial state
  MapCubit(super.initialState);

  LatLng? currentLocation;

  final Location locationController = Location();
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  // Get Current Location
  Future<void> getLocationUpdates() async {

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Enable service
    _serviceEnabled = await locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    // Request location permission
    _permissionGranted = await locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData data) {
      if (data.latitude != null || data.longitude != null) {
        currentLocation = LatLng(data.latitude!, data.longitude!);
        emit(LatLng(data.latitude!, data.longitude!));
      } else {
        // DBServices().create(path: 'location_tracker', data: {
        //   'uid': {
        //     'lat': currentLocation.latitude!,
        //     'lng': currentLocation.longitude!
        //   }
        // });
        //
        // setState(() {
        //   if (!_initializationCompleted) {
        //     _cameraToPosition(_currentP!);
        //   }
        // });
      }
    });
  }

  Future<void> cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: position,
      zoom: 15,
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }
}