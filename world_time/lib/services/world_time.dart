import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location
  String time;
  String flag; //url to an asset flag icon
  String url; //location url for api end points
  bool isDaytime;

  WorldTime({ this.location,this.flag,this.url });

  Future<void> getTime() async {

    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String offset1 = data['utc_offset'].substring(4,6);
//    offset1 = int.parse(offset1);
      int ho = int.parse(offset);
      ho = ho*60;

      //create datetime object
      int min = int.parse(offset1);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(minutes: ho+min ));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);

    }
    catch(e) {
      print('Caught error: $e');
      time = 'could not load time';

    }

    //make the request




    //print(datetime);
    //print(offset);


  }

}


