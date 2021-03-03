import 'package:flutter/material.dart';
import 'package:word_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'de.png', url: 'Europe/Berlin');
    await instance.getTime();
    final daytime = {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    };
    Navigator.pushReplacementNamed(context, '/home', arguments: daytime);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 80.0,
          ),
      ),
    );
  }
}
