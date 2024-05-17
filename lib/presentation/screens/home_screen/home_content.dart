 import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool value = false;
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
            AnimatedToggleSwitch<bool>.size(
              current: value,
              values: [false, true],
              iconOpacity: 2,
              indicatorSize: const Size.fromWidth(100),
              customIconBuilder: (context, local, global) => Text(
                local.value ? 'Active' : 'Inactive',
                style: TextStyle(
                    color: Color.lerp(
                        Colors.black, Colors.white, local.animationValue)),
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
            )
          ]
          ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Control Seats',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 25),)
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.remove),iconSize: 40,),
            SizedBox(width: 50,),
            TextButton(onPressed: (){}, child:Text('reset seats',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey.shade400),) ),
            SizedBox(width: 50,),
            IconButton(onPressed: (){}, icon:Icon(Icons.add),iconSize: 40,),

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
