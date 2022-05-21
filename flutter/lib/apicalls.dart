import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:ipl_stats/widgets/widgets.dart';

String baseUrl = "http://192.168.1.9:5000/";

Future<Map> getData(int type, int season) async {
  String? typ = dataType[dataTypeList[type]];
  debugPrint("$baseUrl/$typ/${seasonsList[season]}");
  Response response =
      await get(Uri.parse("$baseUrl/$typ/${seasonsList[season]}"));
  Map resBody = {};
  Map x = json.decode(response.body);
  for(String i in x.keys) {
    resBody[i] = json.decode(x[i]);
  }
  debugPrint("${resBody["0"]}");
  return resBody;
}
