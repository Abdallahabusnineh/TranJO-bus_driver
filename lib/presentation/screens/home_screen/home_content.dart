import 'dart:async';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bus_driver/core/common_widgets/show_toast.dart';
import 'package:bus_driver/core/utils/app_const.dart';
import 'package:bus_driver/presentation/screens/maps/map_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/app_colors.dart';
import '../../blocs/driver_control_bloc/driver_control_bloc.dart';
import '../../blocs/maps/maps_bloc.dart';
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}
class _HomeContentState extends State<HomeContent>{
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
Widget build(BuildContext context) {
    var MabBloc = context.read<MapsBloc>();
    DriverControlBloc bloc = BlocProvider.of<DriverControlBloc>(context);
  DriverControlBloc blocListener = context.watch<DriverControlBloc>();
  return SingleChildScrollView(
    child: Column(
      children: [
        Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            alignment: AlignmentDirectional.bottomCenter,
            //alignment: Alignment.lerp(Alignment.bottomCenter,Alignment.center , 5),
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                // margin: EdgeInsets.only(top: 15.h),
                decoration: const BoxDecoration(
                  color: AppColors.myGrey,
                ),
                child: MapBuilder(
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    MabBloc.setterNewGoogleController = controller;
                  },
                ),
              ),
              BlocBuilder<DriverControlBloc, DriverControlState>(
                builder: (context, state) {
                  return AnimatedToggleSwitch<bool>.size(
                    current: bloc.toggle,
                    //bloc.toggle,
                    values: [true,false],
                    iconOpacity: 2,
                    indicatorSize: const Size.fromWidth(100),
                    customIconBuilder: (context, local, global) => Text(
                      local.value ? 'InActive' : 'Active',
                      style: TextStyle(
                          color: Color.lerp(Colors.black, Colors.white,
                              local.animationValue)),
                    ),
                    borderWidth: 5.0,
                    iconAnimationType: AnimationType.onHover,
                    style: ToggleStyle(
                        indicatorColor: Colors.blueGrey,
                        borderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 5))
                        ]),
                    selectedIconScale: 1,
                    onChanged: (toggle) {
                      bloc.add(ToggleEvent());
                       if(blocListener.state is SuccessToggleBus) {
                          print('abdallah toggle ${bloc.toggle}');
                          showToast(text: 'done', state: ToastState.SUCCESS);
                        }
                      },
                  );
                },
              )
            ]),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Control Seats',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            blocListener.state is LoadingDropPassenger
                ? SizedBox()
                : IconButton(
              onPressed: () {
                bloc.add(DropPassengerEvent());
              },
              icon: Icon(Icons.remove),
              iconSize: 40,
            ),
            SizedBox(
              width: 50,
            ),
            blocListener.state is ResetNumberOfPassengerLoadingState?
            SizedBox():
            TextButton(
                onPressed: () {
                  bloc.add(ResetSeatsNumberEvent());
                },
                child: Text(
                  'reset seats',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400),
                )),
            SizedBox(
              width: 50,
            ),
            blocListener.state is LoadingAddPassenger
                ? SizedBox()
                : IconButton(
              onPressed: () {
                bloc.add(AddPassengerEvent());
              },
              icon: Icon(Icons.add),
              iconSize: 40,
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Number Of Passenger',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey
              ),
            ),
            const SizedBox(height: 5,),
            Text('${AppConst.numberOfPassenger}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.blueGrey
            ),
            )
          ],
        )
      ],
    ),
  );
}

}
