import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'api.dart';
import 'api_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Covid> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 75),
        child: SafeArea(
          child: Container(
              child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            elevation: 8,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'icons/flags/png/tr.png',
                            package: 'country_icons',
                            scale: 2,
                          ),
                          margin: EdgeInsets.only(right: 20),
                        ),
                        Text(
                          'Türkiye',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
        ),
      ),
      body: FutureBuilder<Covid>(
        future: futureData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child: SafeArea(
                    child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          snapshot.data.date,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          textScaleFactor: 2,
                        ),
                      ),
                      Text(
                        "Tarihindeki COVID-19 tablosu",
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
                (Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icons/died.png',
                                  scale: 5,
                                ),
                                Text(
                                  'Toplam ölü sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.totalDeaths,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icons/died.png',
                                  scale: 5,
                                ),
                                Text(
                                  'Bugünkü ölü sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.deaths,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.thermostat_auto),
                                Text(
                                  'Toplam test sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.totalTests,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.thermostat),
                                Text(
                                  'Bugünkü test sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.tests,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.cases_rounded),
                                Text(
                                  'Toplam hasta sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.totalPatients,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.cases_sharp),
                                Text(
                                  'Bugünkü hasta sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.patients,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text('Zatürre olasılığı')),
                      CircularPercentIndicator(
                        radius: 80.0,
                        lineWidth: 5.0,
                        percent: (int.parse(snapshot.data.pneumoniaPercent
                                .replaceAll(new RegExp(r"[^\s\w]"), '')) /
                            1000),
                        center: new Text('%' +
                            (int.parse(snapshot.data.pneumoniaPercent
                                        .replaceAll(
                                            new RegExp(r"[^\s\w]"), '')) /
                                    10)
                                .toString()),
                        progressColor: Colors.green,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.plus_one),
                                Text(
                                  'Toplam kurtulan sayısı',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.totalRecovered,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.plus_one),
                                Text(
                                  'Bugünkü kurtulan kişi sayısı',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.recovered,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.sick),
                                Text(
                                  'Ağır hasta kişi sayısı',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data.critical,
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
