import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/models/UpcomingModel.dart';
import 'package:netfliex/models/nowplay_model.dart';
import 'package:netfliex/services/api_services.dart';
import 'package:netfliex/view/view_model/home_states.dart';

class moviesCubit extends Cubit<moviesHomeStates> {
  moviesCubit() : super(moviesInitStates());
  //getCategory

  UpcomingModel upcomingModel = UpcomingModel(
      dates: Dates(maximum: DateTime.now(), minimum: DateTime.now()),
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0);
  Future<void> movieCategory() async {
    emit(moviesbyUpcomingLoadingStates());
    try {
      upcomingModel = (await ApiServices.getmoviesbyUpcoming())!;
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

      emit(moviesBysearchSuccessStates(model: value!));
    } catch (e) {
      emit(moviesBysearchErrorStates(error: e.toString()));
    }
  }
  // //getsources

  Future<void> moviesbyNowPlay() async {
    emit(moviesbyNowPlayLoadingStates());
    try {
      await ApiServices.getmoviesbyNowPlay().then((data) {
        emit(moviesbyNowPlaySuccessStates(model: data!));
      });
    } catch (e) {
      emit(moviesbyNowPlayErrorStates(error: e.toString()));
    }
  }



  //Details
  Future<void> getmoviesDetails(int movieId ) async {
    emit(moviesDetailsLoadingStates());
    try {
      var value = await ApiServices.getmoviesDetails(movieId );

      emit(moviesDetailsSuccessStates(model: value!));
    } catch (e) {
      emit(moviesDetailsErrorStates(error: e.toString()));
    }
  }
}
