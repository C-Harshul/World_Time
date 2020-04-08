import 'package:flutter/material.dart';
import 'package:worldtime/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorld() async{
    World obj=World(zone:'Kolkata',flag:'India.png',url:'Asia/Kolkata');
    await obj.getTime();
    setState(() {
      Navigator.pushReplacementNamed(context,'/home',arguments:{
       'zone':obj.zone,'flag':obj.flag,'time':obj.time,'day':obj.day,
       },
      );
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorld();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:SafeArea(child: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        )
      ),
      ),
    );
  }
}
