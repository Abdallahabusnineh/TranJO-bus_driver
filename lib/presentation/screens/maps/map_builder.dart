import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/maps/maps_bloc.dart';

class MapBuilder extends StatefulWidget
{
  MapBuilder({super.key, required this.onMapCreated});

  void Function(GoogleMapController)? onMapCreated;

  @override
  State<MapBuilder> createState() => _MapBuilderState();
}

class _MapBuilderState extends State<MapBuilder> {
  List<LatLng> polylineCoordinates = [];

  @override
  Widget build(BuildContext context) {
    MapsBloc bloc = context.read<MapsBloc>();
    return BlocConsumer<MapsBloc, MapsState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('the statae sisisiis ${state} ||| ${bloc.currentPosition}');
        if (bloc.currentPosition == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GoogleMap(
          onMapCreated: widget.onMapCreated,
          markers: {
            Marker(
              markerId: MarkerId("carlos"),
              position: LatLng(bloc.currentPosition!.latitude,
                  bloc.currentPosition!.longitude),
            ),
          },
          compassEnabled: true,
          myLocationButtonEnabled: true,
          buildingsEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              bloc.currentPosition!.latitude,
              bloc.currentPosition!.longitude,
            ),
            zoom: 15.0,
          ),
        );
      },
    );
  }
}
