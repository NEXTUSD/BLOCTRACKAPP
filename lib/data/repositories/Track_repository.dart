import 'dart:convert';

import 'package:flutter_app20/data/Model/api_result_model.dart';
import 'package:flutter_app20/res/strings.dart';
//import 'package:flutter_app20/res/strings.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart';
//import 'dart:convert';

abstract class TrackRepository {
  Future<List<TrackList>> getTrackList();

}
class TrackRepositoryImpl implements TrackRepository {
  @override
  Future<List<TrackList>> getTrackList() async {
    var response = await http.get(AppStrings.cricTrackListUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<TrackList> trackList = ApiResultModel.fromJson(data).trackList;
      return trackList;
    } else {
      throw Exception();
    }
  }

}

