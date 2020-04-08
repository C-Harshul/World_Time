import 'dart:async';
import 'package:worldtime/Services/world_time.dart';
import 'package:flutter/material.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<World> Zones=[
   World(zone:'Kolkata',flag:'India.PNG',url:'Asia/Kolkata'),
   World(zone:'Chicago',flag:'USA.PNG',url:'America/Chicago'),
   World(zone:'London',flag:'UK.PNG',url:'Europe/London'),
  ];
 void updateTime(index)async{
   World obj=Zones[index];
   await obj.getTime();
   Navigator.pop(context,{
     'zone':obj.zone,'flag':obj.flag,'time':obj.time,'day':obj.day,
     }
   );

 }
  @override
  Widget build(BuildContext context) {
    print('Build RAN');
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text('Choose location'),
        centerTitle: true,
      ),
      body:ListView.builder(
          itemCount:Zones.length,
          itemBuilder:(context, index){
            return Card(
              child:ListTile(
                onTap:(){
                  updateTime(index);
                },
                  title: Text(Zones[index].zone,
                  style:TextStyle(
                  fontSize: 50,
                   ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:AssetImage('back/${Zones[index].flag}')),
              ),
            );
          },
        ),
    );
  }
}
