import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsInitial()) {
    on<SetNewGoogleMapController>((_onSetNewGoogleMapController));
    on<GetCurrentLocation>((_onGetCurrentLocation));
  }

  Position? currentPosition;
  late GoogleMapController _newGoogleMapController;

  GoogleMapController get newGoogleMapController => _newGoogleMapController;

  set setterNewGoogleController(GoogleMapController controller) {
    _newGoogleMapController = controller;
    add(SetNewGoogleMapController());
  }

  void _onSetNewGoogleMapController(
    SetNewGoogleMapController event,
    Emitter emit,
  ) async {
    emit(MapsSetNewGoogleMapControllerState());
  }

  void _onGetCurrentLocation(
    GetCurrentLocation event,
    Emitter emit,
  ) async {
    try {
      emit(MapsGetCurrentLocationLoadingState());
      print('we enter dkdkdkkd ');
      if (await checkPermission()) {
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high)
            .then((Position position) {

          currentPosition = position;
          // changeNewGoogleMapController(position.latitude, position.longitude);
          emit(MapsGetCurrentLocationSuccessState());
        }).catchError((e) {
          debugPrint(e);
          emit(MapsGetCurrentLocationFailState());
        });
      }
      print('the we finishiididid ${currentPosition}');
    } catch (e) {
      debugPrint("Error is CheckPermissionOfLocation ::: ${e.toString()}");
      emit(MapsGetCurrentLocationFailState());
    }
  }

  Future<bool> checkPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (await Permission.location.serviceStatus.isEnabled) {
    } else {
      openAppSettings();
      return false;
    }
    if (status.isGranted) {
    } else if (status.isDenied) {
      Map<Permission, PermissionStatus> status = await [
        Permission.location,
      ].request();
      print('the status of request is ${status}');
      return false;
    }
    if (await Permission.location.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return true;
  }

  Future<void> changeNewGoogleMapController(lat, long) async {
    try {
      await newGoogleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, long), zoom: 15),
        ),
      );
    } catch (e) {
      print('teh rererree esdfsad ${e.toString()}');
    }
  }
}
