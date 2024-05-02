// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

int selectedIndex = 0;

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1f1f1f),
        body: Consumer<WeatherViewModel>(builder: (context, viewModel, child) {
          if (viewModel.weather == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${viewModel.weather?.location.locality}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${viewModel.weather?.location.country}, ${viewModel.weather?.location.city}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    viewModel.getFormattedDate(DateTime.now()),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff8a8a8a),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: Color(0x00000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 80, 10, 45),
                          child: Align(
                            alignment: Alignment.center,
                            child: Lottie.asset(
                              "${viewModel.display?.state["path"]}",
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                              repeat: true,
                              animate: true,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.0, -1),
                          child: Text(
                            "${viewModel.display?.temperature.toInt() ?? 0}°",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 72,
                              color: Color.fromARGB(230, 255, 255, 255),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.0, 0.75),
                          child: Text(
                            viewModel.display?.state["condition"] ??
                                "loading weather...",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.0, 0.9),
                          child: Text(
                            "${viewModel.display?.temperatureMin.toInt()}° ~ ${viewModel.display?.temperatureMax.toInt()}°",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Lottie.asset(
                                    "assets/wind_icon.json",
                                    height: 24,
                                    width: 24,
                                    fit: BoxFit.fitWidth,
                                    repeat: true,
                                    animate: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: Text(
                                    "${viewModel.display?.windSpeed.toInt() ?? "--"} km/h",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Wind",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff959595),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Lottie.asset(
                                  "assets/waterdrop01.json",
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.fitWidth,
                                  repeat: true,
                                  animate: true,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: Text(
                                    "${viewModel.display?.humidity ?? "--"}%",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Humidity",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff959595),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Lottie.asset(
                                  "assets/rain_icon.json",
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.fitWidth,
                                  repeat: true,
                                  animate: true,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: Text(
                                    "${viewModel.display?.rain.toInt() ?? "--"} mm",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Rain",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff959595),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                    padding: EdgeInsets.zero,
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0,
                    decoration: BoxDecoration(
                      color: Color(0x00000000),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 1.5,
                          child: Text(
                            "Current Week",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 160,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: false,
                            physics: AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.weather?.daily.time.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    // Toggle the border color when the container is tapped
                                    selectedIndex = index;
                                    viewModel.changeDay(index);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  padding: EdgeInsets.zero,
                                  width: 125,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0x1f000000),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(15.0),
                                    // Change the border color based on the selection state
                                    border: Border.all(
                                      color: selectedIndex == index
                                          ? Colors.blue
                                          : Color(0x4d9e9e9e),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "${((viewModel.weather?.daily.temperature2mMin[index] ?? 0) + (viewModel.weather?.daily.temperature2mMax[index] ?? 0)) ~/ 2}°C",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        Lottie.asset(
                                          "${viewModel.getWeatherCondition(weatherCode: viewModel.weather?.daily.weatherCode[index] ?? 0, override: true)["path"]}",
                                          height: 75,
                                          fit: BoxFit.contain,
                                          repeat: true,
                                          animate: true,
                                        ),
                                        Text(
                                          viewModel.getFormattedDate(
                                              DateTime.tryParse(viewModel
                                                      .weather
                                                      ?.daily
                                                      .time[index] ??
                                                  DateTime.now().toString())!),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color: Color(0xff959595),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        }));
  }
}
