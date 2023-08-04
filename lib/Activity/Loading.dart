import 'package:flutter/material.dart';
import 'package:app2/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String temp = '';
  String humidity = '';
  double air_speed = 0;
  String description = '';
  String main = '';
  String icon = '';
  String city = 'Barishal';
  void startapp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'temp_value' : temp,
        'hum_value' : humidity,
        'air_speed_value' : air_speed,
        'description_value': description,
        'main_value' : main,
        'icon_value' : icon,
        'city_value' : city,
      });
    });




  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search?['Search_value'];
    }
    //
    startapp(city);
    return  Scaffold(
      body: Center (

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            //SizedBox(height: 300,),
            Image.asset('Images/weather.png',
                width: 300,
                height: 300,
            ),
            SizedBox(height: 40,),
            Text("Weather App", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
            SizedBox(height: 10,),

        SizedBox(height: 50,),
        SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
          ],
        )
      ),
      backgroundColor: Colors.blue,
    );
  }
}
