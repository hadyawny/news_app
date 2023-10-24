import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/shared/constants/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.https(base, "/v2/top-headlines/sources", {"apiKey": apiKey,"category":category});

    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);

    return sourcesResponse;
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(
        base, "/v2/everything", {"apiKey": apiKey, "sources": sourceId});

    http.Response response = await http.get(url);

    var jasonData = jsonDecode(response.body);

    NewsDataModel newsDataModel = NewsDataModel.fromJson(jasonData);

    return newsDataModel;
  }
}
