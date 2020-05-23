import 'package:flutter/material.dart';
import 'package:world_time/services/time_service.dart';

class KonumView extends StatefulWidget {
  @override
  _KonumViewState createState() => _KonumViewState();
}

class _KonumViewState extends State<KonumView> {
  List<TimeService> konumlar = [
    TimeService(url: "Europe/Istanbul", bayrak: "AD", konum: "Istanbul"),
    TimeService(url: "Europe/Rome", bayrak: "", konum: "Rome"),
    TimeService(url: "Europe/Moscow", bayrak: "", konum: "Moscow"),
    TimeService(url: "Europe/Monaco", bayrak: "", konum: "Monaco"),
    TimeService(url: "Europe/Madrid", bayrak: "", konum: "Madrid"),
    TimeService(url: "America/Los_Angeles", bayrak: "", konum: "Los Angeles"),
    TimeService(url: "Asia/Tokyo", bayrak: "", konum: "Tokyo"),
    TimeService(url: "America/New_York", bayrak: "", konum: "New York"),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Konum Sec"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: konumlar.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              child: Card(
                child: ListTile(
                  onTap: () {
                    zamanGuncelle(index);
                  },
                  title: Text(konumlar[index].konum),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://geology.com/google-earth/google-earth.jpg"),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> zamanGuncelle(index) async {
    TimeService model = konumlar[index];
    await model.getZaman();
    Navigator.pop(context, {
      "konum": model.konum,
      "bayrak": model.bayrak,
      "zaman": model.zaman,
      "gunZaman": model.gunZaman
    });
  }
}
