import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/model/date_model.dart';

class DataServices {
  String baseUrl = "https://jsonplaceholder.typicode.com";
  Future<List<DataModel>> getInfo() async{
    var apiUrl = "/posts";
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = jsonDecode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}