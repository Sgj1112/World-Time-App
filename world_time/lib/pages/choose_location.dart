import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtime/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}



class _ChooseLocationState extends State<ChooseLocation> {

//  List <String> locations;
//
//  void getLocation() async {
//    Response response = await get('http://worldtimeapi.org/api/timezone');
//    locations = jsonDecode(response.body);
//  }
//
//  @override
//  void initState() {
//
//    super.initState();
//    getLocation();
//  }
//
//  List <WorldTime> locations1 =
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'kolkata.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }

      ),
    );
  }
}
