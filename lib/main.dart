import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2_provider/screens/home_page.dart';
import 'package:weather_app_2_provider/services/location_provider.dart';
import 'package:weather_app_2_provider/services/weather_service_provider.dart';

void main(){

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create:(context) => LocationProvider(),),
        ChangeNotifierProvider(create:(context) => WeatherServiceProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(appBarTheme:AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation:0,
        )),
        home: HomePage(),
      ),
    );
  }
}