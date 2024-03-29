

import 'package:netfliex/core/constants/app_constant.dart';
import 'package:netfliex/models/UpcomingModel.dart';
import 'package:dio/dio.dart';
import 'package:netfliex/models/details_model.dart';

import 'package:netfliex/models/nowplay_model.dart';
import 'package:netfliex/models/search_model.dart';

class ApiServices {
  static Future<UpcomingModel?> getmoviesbyUpcoming() async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}movie/upcoming?api_key=${Appconstant.apikay}');

      if (res.statusCode == 200) {
        UpcomingModel movies = UpcomingModel.fromJson(res.data);
        return movies;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // getmoviesbyNewPlay


  static Future<TrendingModel?> getmoviesbyNowPlay() async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}trending/movie/week?api_key=${Appconstant.apikay}');

      if (res.statusCode == 200) {
        TrendingModel movies = TrendingModel.fromJson(res.data);
        return movies ;
      }
    } catch (e) {
      print(e.toString());
    }
  }



  static Future<SearchModel?> getmoviesbysearch(String search ) async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}search/movie?query=$search&api_key=${Appconstant.apikay}');

      if (res.statusCode == 200) {
        SearchModel movies = SearchModel.fromJson(res.data);
        return movies ;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  static Future<DetailsModel?> getmoviesDetails(int movieId ) async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}search/movie?query=$movieId&api_key=${Appconstant.apikay}');

      if (res.statusCode == 200) {
        DetailsModel movies = DetailsModel.fromJson(res.data);
        return movies ;
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
