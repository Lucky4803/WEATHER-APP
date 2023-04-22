import 'package:flutter/material.dart';
import 'package:weather_application/backvideo.dart';
import 'package:weather_application/repo.dart';
import 'package:weather_application/weather_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 2, 75, 14),
        )),
        home: Scaffold(
          resizeToAvoidBottomInset: false,//to avoid bottom overflowed
            appBar: AppBar(
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'WEATHER APP    ',
                  style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontSize: 26.0,
                  ),
                ),
                Container(
                  child: Image.network(
                      'https://tse4.mm.bing.net/th?id=OIP.z6B_lWe0SB4SVUaSc3CXWAHaHa&pid=Api&P=0'),
                  width: 40,
                )
              ]),

              //  backgroundColor: primaryColor,
            ),
            body: Stack(children: [
              const BackgroundVideoWidget(),
              Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 110,
                        width: 500,
                        child: Image.asset('assets/p1'),
                        alignment: Alignment.topCenter
//  crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                    const SizedBox(
                      height: 55,
                    ),
const SizedBox(
                      width: 55,
                    ),
                    SizedBox(
                      width: 180,
                      
                      child: TextField( style: TextStyle(color: Color.fromARGB(255, 213, 225, 233),fontSize: 15,),
                        controller: controller,
                        decoration:
                            InputDecoration(hintText: '       enter location',hintStyle: TextStyle(color: Color.fromARGB(255, 4, 122, 49),fontSize: 19),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(31, 175, 36, 36),)
                            ,)),
                            
                       
                        
                            cursorWidth: 15,
                            cursorColor: Color.fromARGB(255, 230, 216, 24),
                            
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    ElevatedButton(
                      
                        onPressed: () async {
                          weatherModel =
                              await Repo().getWeather(controller.text);
                          print(weatherModel?.main?.temp ?? "error");
                          setState(() {});
                        },
                        
                        child: Text("search")),
                    const SizedBox(
                      height: 20,
                    ),
                    // Map tem={weatherModel?.main?.temp},
                    Text(
                      "CURRENT TEMP:       ${weatherModel?.main?.temp}°F",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 234, 236, 217),backgroundColor:Color.fromARGB(232, 11, 68, 122),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "MIN TEMP:    ${weatherModel?.main?.tempMin}°F",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 248, 251, 253),backgroundColor:Color.fromARGB(181, 14, 107, 160),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "MAX TEMP :      ${weatherModel?.main?.tempMax}°F",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(123, 13, 229, 236),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "SEALEVEL:    ${weatherModel?.main?.seaLevel}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 16, 151, 4),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "HUMIDITY:    ${weatherModel?.main?.humidity}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 167, 196, 4),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "FEELS LIKE:    ${weatherModel?.main?.feelsLike}°F",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 202, 112, 9),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "wind speed:    ${weatherModel?.wind?.speed}°ms",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 197, 10, 10),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "sunrise:    ${weatherModel?.sys?.sunrise}°",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 201, 77, 77),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "clouds:    ${weatherModel?.clouds?.all}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 57, 202, 105),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "latitude:    ${weatherModel?.coord?.lat}°",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 74, 76, 207),
                      ),
                    ),const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "longitude:    ${weatherModel?.coord?.lon}°",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 245, 230),backgroundColor:Color.fromARGB(181, 122, 11, 11),
                      ),
                    ),
                   
                  ],
                ),
              )
            ])));
  }
}
