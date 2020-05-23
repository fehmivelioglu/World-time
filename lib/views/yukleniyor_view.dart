import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/time_service.dart';

class YukleniyorView extends StatefulWidget {
  @override
  _YukleniyorViewState createState() => _YukleniyorViewState();
}

class _YukleniyorViewState extends State<YukleniyorView> {
  String zaman = "Yükleniyor";

  void setupWorldTime() async {
    TimeService timeService =
        TimeService(konum: "Berlin", bayrak: "", url: "Europe/Berlin");

    await timeService.getZaman();
    print(timeService.zaman);
    setState(() {
      zaman = timeService.zaman;
    });

    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "konum":timeService.konum,
      "bayrak":timeService.bayrak,
      "zaman":timeService.zaman,
      "gunZaman":timeService.gunZaman
    });
  }

  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child:
            SpinKitThreeBounce(
              color:Colors.blueAccent,
              size: 90,
            ),
              // child: zaman == "Yükleniyor"
              //     ? CircularProgressIndicator()
              //     : Text("Yükleniyor")
                  )),
    );
  }
}
