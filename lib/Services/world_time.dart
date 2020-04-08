import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class World{
  String zone;
  String url;
  String flag;
  String time;
  bool day;
  World({this.zone,this.url,this.flag});

  Future<void> getTime() async{
    try{
  Response response=await get('http://worldtimeapi.org/api/timezone/$url');

  Map time=jsonDecode(response.body);
  print(time);
  print(time['datetime']);
  String datetime=time['datetime'];

  int offsethrs=int.parse(time['utc_offset'].substring(0,3));
  int offsetmins=int.parse(time['utc_offset'].substring(4,6));
  print(offsethrs);
  print(offsetmins);
  DateTime now=DateTime.parse(datetime);
  now=now.add(Duration(hours:offsethrs,minutes:offsetmins));
  print('$now');
  if(now.hour>6 && now.hour<18)
    day=true;
  else
    day=false;
  this.time=DateFormat.jm().format(now);

   }
   catch(e) {
      print('---------ERROR---------    $e');
      time='COULD NOT GET THE TIME';

    }
  }
}