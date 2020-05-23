
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map routeVeriler = {};
  String bgResim;

  @override
  Widget build(BuildContext context) {
    routeVeriler = routeVeriler.isNotEmpty
        ? routeVeriler
        : ModalRoute.of(context).settings.arguments;
    bgResim = routeVeriler["gunZaman"] ? "morning.jpg" : "night.jpg";
    print(bgResim);
    print(routeVeriler);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgResim"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic sonuc =
                        await Navigator.pushNamed(context, "/konum");
                    if (sonuc != null) {
                      setState(() {
                        routeVeriler = {
                          "zaman": sonuc["zaman"],
                          "konum": sonuc["konum"],
                          "gunZaman": sonuc["gunZaman"],
                          "bayrak": sonuc["bayrak"]
                        };
                      });
                    }
                  },
                  icon: Icon(Icons.location_on,color: Colors.blue,),
                  label: Text(
                    "Konum Düzenle",
                    style: TextStyle(color: Colors.blue),
                  )),
              SizedBox(height: 120),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    routeVeriler["konum"],
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2, color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    routeVeriler["zaman"],
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
