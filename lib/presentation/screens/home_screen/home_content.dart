import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bus_driver/core/common_widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/driver_control_bloc/driver_control_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: 450,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/map_image.jpg'))),
                ),
                BlocBuilder<DriverControlBloc, DriverControlState>(
                        builder: (context, state) {
                          return AnimatedToggleSwitch<bool>.size(
                            current: bloc.toggle,
                            //bloc.toggle,
                            values: [false, true],
                            iconOpacity: 2,
                            indicatorSize: const Size.fromWidth(100),
                            customIconBuilder: (context, local, global) => Text(
                              local.value ? 'Active' : 'Inactive',
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
                             /* if(blocListener.state is SuccessToggleBus)
                                showToast(text: 'done', state: ToastState.SUCCESS);*/
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
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.blueGrey,
                    ))
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
              TextButton(
                  onPressed: () {},
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
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.blueGrey,
                    ))
                  : IconButton(
                    onPressed: () {
                      bloc.add(AddPassengerEvent());
                    },
                    icon: Icon(Icons.add),
                    iconSize: 40,
                  ),
            ],
          )
          /*  AnimatedToggleSwitch<bool>.size(
            current: value,
            values: [false, true],
            iconOpacity: 2,
            indicatorSize: const Size.fromWidth(100),
            customIconBuilder: (context, local, global) => Text(
              local.value?'Active':'Inactive',style: TextStyle(color: Color.lerp(Colors.black, Colors.white, local.animationValue)),
            ),
            borderWidth:5.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              indicatorColor: Colors.grey.shade700,
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 1,blurRadius: 2,offset: Offset(0,5)
              )]
            ),
            selectedIconScale: 1,
      
          )*/
        ],
      ),
    );
  }
}
