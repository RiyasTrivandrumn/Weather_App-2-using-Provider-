import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2_provider/data/image_path.dart';
import 'package:weather_app_2_provider/services/location_provider.dart';
import 'package:weather_app_2_provider/services/weather_service_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
    final locationProvider= Provider.of<LocationProvider>(context,listen: false);
    locationProvider.determinePosition().then((_) {
    if(locationProvider.currentLocationName!= null){
      var city=locationProvider.currentLocationName!.locality;

      if(city != null){
        Provider.of<WeatherServiceProvider>(context,listen: false).fetchWeatherDataByCity(city);
      }

    }



    });


    // Provider.of<LocationProvider>(context,listen: false).determinePosition();
    // Provider.of<WeatherServiceProvider>(context,listen: false).fetchWeatherDataByCity("Dubai");


    super.initState();
  }



  bool _clicked=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
final locationProvider=Provider.of<LocationProvider>(context);  //location providers object creation
 final weatherProvider=Provider.of<WeatherServiceProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background[weatherProvider.weather!.weather![0].main??"N/A "]??"assets/img/default.jpg"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            _clicked == true?
 Positioned(
  top: 50,
  left: 20,
  right: 20,
   child: Container(
    height: 45,
    
    child: TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          
          
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        )
      ),
    ),
   ),
 ):SizedBox.shrink(),

            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 50,
                    child: Consumer<LocationProvider>(builder: (context, locationProvider, child) {
                      var locationCity;
                      if(locationProvider.currentLocationName != null){
                        locationCity = locationProvider.currentLocationName!.locality;
                      }else{
                        locationCity = "Unknown Location";
                      }
                      return Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locationCity,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        )
                      ],
                    );
                    } ,),
                  ),
                 
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _clicked=!_clicked;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 32.0,
                      ))
                ],
              ),
            ),
            Align(
                alignment: Alignment(0, -0.7),
                child: Image.asset(imagePath[weatherProvider.weather!.weather![0].main??"N/A "]??"assets/img/default.jpg")),
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                height: 130,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${weatherProvider.weather!.main!.temp?.toStringAsFixed(0)}" + "°C",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    
                    Text(
                      weatherProvider.weather!.weather![0].main.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                    Text(
                      DateFormat("h:mm a").format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, .7),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Column(
                      children: [
                        Row(
                          children: [Image.asset("assets/img/temperature-high.png",height: 55,),
                          Column(
                            children: [
                              Text("Temp Max",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                               Text("${weatherProvider.weather!.main!.tempMax!.toStringAsFixed(0)}°C",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                              
                            ],
                          )],
                        ),
                       
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Row(
                          children: [Image.asset("assets/img/temperature-low.png",height: 55,),
                          Column(
                            children: [
                              Text("Temp Min",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                               Text("${weatherProvider.weather!.main!.tempMin!.toStringAsFixed(0)}°C",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                              
                            ],
                          )],
                        ),
                       
                      ],
                    ),
                            
                             ] ),
           
           
           Divider(indent: 20,
           endIndent: 20,
           color: Colors.white,
           thickness: 2,
           ),
           Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Column(
                      children: [
                        Row(
                          children: [Image.asset("assets/img/sun.png",height: 55,),
                          Column(
                            children: [
                              Text("Sunrise",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                               Text("29°C",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                              
                            ],
                          )],
                        ),
                       
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Row(
                          children: [Image.asset("assets/img/moon.png",height: 55,),
                          Column(
                            children: [
                              Text("Sunset",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                               Text("29°C",style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
                              
                            ],
                          )],
                        ),
                       
                      ],
                    ),
                            
                             ] ),] ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
