import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class TimeService {
  String konum;
  String zaman;
  String bayrak;
  String url;
  bool gunZaman ;

  TimeService({this.konum, this.bayrak, this.url});

  // TimeService.fromJson(Map<String, dynamic> json) {
  //   abbreviation = json['abbreviation'];
  //   clientIp = json['client_ip'];
  //   datetime = json['datetime'];
  //   dayOfWeek = json['day_of_week'];
  //   dayOfYear = json['day_of_year'];
  //   dst = json['dst'];
  //   dstFrom = json['dst_from'];
  //   dstOffset = json['dst_offset'];
  //   dstUntil = json['dst_until'];
  //   rawOffset = json['raw_offset'];
  //   timezone = json['timezone'];
  //   unixtime = json['unixtime'];
  //   utcDatetime = json['utc_datetime'];
  //   utcOffset = json['utc_offset'];
  //   weekNumber = json['week_number'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['abbreviation'] = this.abbreviation;
  //   data['client_ip'] = this.clientIp;
  //   data['datetime'] = this.datetime;
  //   data['day_of_week'] = this.dayOfWeek;
  //   data['day_of_year'] = this.dayOfYear;
  //   data['dst'] = this.dst;
  //   data['dst_from'] = this.dstFrom;
  //   data['dst_offset'] = this.dstOffset;
  //   data['dst_until'] = this.dstUntil;
  //   data['raw_offset'] = this.rawOffset;
  //   data['timezone'] = this.timezone;
  //   data['unixtime'] = this.unixtime;
  //   data['utc_datetime'] = this.utcDatetime;
  //   data['utc_offset'] = this.utcOffset;
  //   data['week_number'] = this.weekNumber;
  //   return data;
  // }

  Future<void> getZaman() async {
    try {
      Response res = await get("http://worldtimeapi.org/api/timezone/$url");
    Map veri = jsonDecode(res.body);

    String dateTime = veri["datetime"];
    DateTime now = DateTime.parse(dateTime);

    String offSet =
        veri["utc_offset"].substring(1, 3); //1. indexden başlar 3 dahil değil
    now = now.add(Duration(hours: int.parse(offSet)));
    zaman=DateFormat.jm().format(now);
    gunZaman=now.hour>6 && now.hour<20? true:false;
    } catch (e) {
      zaman= "Bir hata meydana geldi : $e";
    }
    
  }
}
