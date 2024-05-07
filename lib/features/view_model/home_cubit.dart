import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/features/Details/view_model/details_model.dart';
import 'package:netfliex/features/Discover/view_model/now_playing_model.dart';
import 'package:netfliex/features/home/view_model/UpcomingModel.dart';
import 'package:netfliex/features/home/view_model/trending_model.dart';
import 'package:netfliex/features/view_model/home_states.dart';
import 'package:netfliex/models/recommendations_model.dart';
import 'package:netfliex/services/api_services.dart';

class moviesCubit extends Cubit<moviesHomeStates> {
  moviesCubit() : super(moviesInitStates());
  //getCategory

  UpcomingModel upcomingModel =
      UpcomingModel(page: 0, results: [], totalPages: 0, totalResults: 0);
  Future<void> movieCategory() async {
    emit(moviesbyUpcomingLoadingStates());
    try {
      upcomingModel = await ApiServices.getmoviesbyUpcoming();
      emit(moviesbyUpcomingSuccessStates(model: upcomingModel));
    } catch (e) {
      emit(moviesbyUpcomingErrorStates(error: e.toString()));
    }
  }

  //getsearch
  Future<void> getmoviesSearch(String search) async {
    emit(moviesBysearchLoadingStates());
    try {
      var value = await ApiServices.getmoviesbysearch(search);

      emit(moviesBysearchSuccessStates(model: value));
    } catch (e) {
      emit(moviesBysearchErrorStates(error: e.toString()));
    }
  }

  // //getsources
  TrendingModel trendingModel =
      TrendingModel(page: 1, results: [], totalPages: 1, totalResults: 1);
  Future<void> moviesbyNowPlay() async {
    emit(moviesbyNowPlayLoadingStates());
    try {
      trendingModel = await ApiServices.getmoviesbyNowPlay();
      emit(moviesbyNowPlaySuccessStates(model: trendingModel));
    } catch (e) {
      emit(moviesbyNowPlayErrorStates(error: e.toString()));
    }
  }

  //Details

  DetailsModel detailsModel =
      DetailsModel();
  Future<void> getmoviesDetails(int movieId) async {
    emit(moviesDetailsLoadingStates());
    try {
      var value = await ApiServices.getmoviesDetails(movieId);

      emit(moviesDetailsSuccessStates(model: value!));
    } catch (e) {
      emit(moviesDetailsErrorStates(error: e.toString()));
    }
  }

  RecommendationsModel recommendations = RecommendationsModel(
      page: 1, results: [], totalPages: 1, totalResults: 1);
  Future<void> getmoviesrecommendations(int movieId) async {
    emit(moviesrecommendationsLoadingStates());
    try {
      recommendations = await ApiServices.getmoviesrecommendations(movieId);

      emit(moviesrecommendationsSuccessStates(model: recommendations));
    } catch (e) {
      emit(moviesrecommendationsErrorStates(error: e.toString()));
    }
  }

  NowPlaying Nowplaying =
      NowPlaying(page: 0, results: [], totalPages: 0, totalResults: 0);
  Future<void> getmoviesbyNowplay() async {
    emit(moviesbyNowplayLoadingStates());
    try {
      Nowplaying = await ApiServices.getmoviesbyNowplay();
      emit(moviesbyNowplaySuccessStates(model: Nowplaying));
    } catch (e) {
      emit(moviesbyNowplayErrorStates(error: e.toString()));
    }
  }
}
