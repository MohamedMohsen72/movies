
import 'package:dio/dio.dart';
import 'package:netfliex/core/constants/app_constant.dart';
import 'package:netfliex/features/Details/view_model/details_model.dart';
import 'package:netfliex/features/Discover/view_model/now_playing_model.dart';
import 'package:netfliex/features/home/view_model/UpcomingModel.dart';
import 'package:netfliex/features/home/view_model/trending_model.dart';
import 'package:netfliex/features/search/view_model/search_model.dart';
import 'package:netfliex/models/recommendations_model.dart';

class ApiServices {
  static Future<UpcomingModel> getmoviesbyUpcoming() async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}movie/upcoming?api_key=${Appconstant.apikay}');
      print(res);
      if (res.statusCode == 200) {
        UpcomingModel movies = UpcomingModel.fromJson(res.data);
        return movies;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // getmoviesbyNewPlay

  static Future<TrendingModel> getmoviesbyNowPlay() async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}trending/movie/week?api_key=${Appconstant.apikay}');
      print('---------------Trinding------------');
      print(res);
      if (res.statusCode == 200) {
        TrendingModel movies = TrendingModel.fromJson(res.data);
        return movies;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<SearchModel> getmoviesbysearch(String search) async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}search/movie?query=$search&api_key=${Appconstant.apikay}');
      print(res);
      if (res.statusCode == 200) {
        SearchModel movies = SearchModel.fromJson(res.data);
        return movies;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<DetailsModel?> getmoviesDetails(int movieId ) async {
    try {

      var res = await Dio().get(
          '${Appconstant.url}movie/$movieId?api_key=${Appconstant.apikay}');
      print('-----------------Details----------------------');
      print(res);


      if (res.statusCode == 200) {
        DetailsModel movies = DetailsModel.fromJson(res.data);
        return movies ;
      }else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<RecommendationsModel> getmoviesrecommendations(int movieId ) async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}movie/$movieId/recommendations?api_key=${Appconstant.apikay}');
      print('-----------------recommendations----------------------');
      print(res);

      if (res.statusCode == 200) {
        RecommendationsModel movies = RecommendationsModel.fromJson(res.data);
        return movies ;
      }else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<NowPlaying> getmoviesbyNowplay() async {
    try {
      var res = await Dio().get(
          '${Appconstant.url}movie/now_playing?api_key=${Appconstant.apikay}');
      print('---------------now_playing------------');
      print(res);
      if (res.statusCode == 200) {
        NowPlaying movies = NowPlaying.fromJson(res.data);
        return movies;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}

