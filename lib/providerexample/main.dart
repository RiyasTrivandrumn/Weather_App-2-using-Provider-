


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2_provider/providerexample/homepage2.dart';
import 'package:weather_app_2_provider/providerexample/numberlistprovider.dart';

void main(){

runApp(MyApp());


}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(
      create: (context){
        return NumberListProvider();

      },),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage2(),
      ),
      
      );
    
  }
}