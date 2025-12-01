import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftc/map/map_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_view.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(LatLng(37.4223, -122.0848)),
      child: const MapView(),
    );
  }
}
