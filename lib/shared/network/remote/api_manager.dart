import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/sources_response.dart';


class ApiManager {


  static Future<SourcesResponse> getSources()async{

     Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",{"apiKey":"19e4709e5fe64fcaaf4de4ffacdbbed2"});

    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);

    return sourcesResponse;
  }


}