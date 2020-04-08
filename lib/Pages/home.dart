import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data['day']);
    String bgloc= data['day']? 'back/day.png':'back/night.png';
    print(bgloc);
    return Scaffold(
    body:Container(
      decoration:BoxDecoration(
        image:DecorationImage(
          image:AssetImage(bgloc),
          fit:BoxFit.cover,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: SafeArea(
            child:Column(
              children: <Widget>[

                FlatButton.icon(
                  icon:Icon(Icons.edit_location,size:40,
                  color:Colors.white
                  ),
                  label:Text('Edit location',
                  style:TextStyle(
                   fontSize:30,
                   color:Colors.white,
                   ),
                  ),
                  onPressed: ()async{
                    dynamic result=await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data={
                        'time':result['time'],'flag':result['flag'],'zone':result['zone'],'day':result['day'],
                      };
                    });

                  },

                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['zone'],
                        style:TextStyle(
                          fontSize:20,
                          color:Colors.white,
                          letterSpacing:1,
                          fontWeight:FontWeight.bold,
                        )
                    ),
                  ],
                ),
                SizedBox(height:10),
                Text(data['time'],
                style:TextStyle(
                  fontSize:70,
                  color:Colors.white,
                  letterSpacing:1,
                  fontWeight:FontWeight.bold,
                )),
              ],
            ),
           ),
      ),
    ),
    );
  }
}
