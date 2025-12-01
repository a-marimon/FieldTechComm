import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftc/map/map_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, LatLng>(builder: (context, state) {

        context.read<MapCubit>().getLocationUpdates();

        print(state);

        return Center(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: state,
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: state,
                icon: BitmapDescriptor.defaultMarker,
              ),
            },
          ),
        );
      }),
    );
  }
}
