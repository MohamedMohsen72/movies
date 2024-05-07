
import 'package:netfliex/features/Details/view_model/details_model.dart';
import 'package:netfliex/features/Discover/view_model/now_playing_model.dart';
import 'package:netfliex/features/home/view_model/UpcomingModel.dart';
import 'package:netfliex/features/home/view_model/trending_model.dart';
import 'package:netfliex/features/search/view_model/search_model.dart';
import 'package:netfliex/models/recommendations_model.dart';


class moviesHomeStates{}

class moviesInitStates extends moviesHomeStates{}

class moviesbyUpcomingLoadingStates extends moviesHomeStates{}
class moviesbyUpcomingSuccessStates extends moviesHomeStates{
  final UpcomingModel model;
  moviesbyUpcomingSuccessStates( {required this.model});
}
class moviesbyUpcomingErrorStates extends moviesHomeStates{
  String error;
  moviesbyUpcomingErrorStates({required this.error});
}


class  moviesBysearchLoadingStates extends  moviesHomeStates{}
class  moviesBysearchSuccessStates extends  moviesHomeStates{
  final SearchModel model;
  moviesBysearchSuccessStates( {required this.model});
}
class  moviesBysearchErrorStates extends  moviesHomeStates{
  String error;
  moviesBysearchErrorStates({required this.error});
}
// //Trending
class moviesbyNowPlayLoadingStates extends moviesHomeStates{}
class moviesbyNowPlaySuccessStates extends moviesHomeStates{
  final TrendingModel model;
  moviesbyNowPlaySuccessStates( {required this.model});
}
class moviesbyNowPlayErrorStates extends moviesHomeStates{
  String error;
  moviesbyNowPlayErrorStates({required this.error});
}

//Details
class  moviesDetailsLoadingStates extends  moviesHomeStates{}
class  moviesDetailsSuccessStates extends  moviesHomeStates{
  final DetailsModel model;
  moviesDetailsSuccessStates( {required this.model});
}
class  moviesDetailsErrorStates extends  moviesHomeStates{
  String error;
  moviesDetailsErrorStates({required this.error});
}

class  moviesrecommendationsLoadingStates extends  moviesHomeStates{}
class  moviesrecommendationsSuccessStates extends  moviesHomeStates{
  final RecommendationsModel model;
  moviesrecommendationsSuccessStates( {required this.model});
}
class  moviesrecommendationsErrorStates extends  moviesHomeStates {
  String error;

  moviesrecommendationsErrorStates({required this.error});
}
// //Nowplay
class moviesbyNowplayLoadingStates extends moviesHomeStates{}
class moviesbyNowplaySuccessStates extends moviesHomeStates{
  final NowPlaying model;
  moviesbyNowplaySuccessStates( {required this.model});
}
class moviesbyNowplayErrorStates extends moviesHomeStates{
  String error;
  moviesbyNowplayErrorStates({required this.error});
}


class RegisterLoadingStates extends moviesHomeStates {}

class RegisterSuccessStates extends moviesHomeStates {}

class RegisterErrorStates extends moviesHomeStates {
  final String error;

  RegisterErrorStates({required this.error});
}

//login

class LoginLoadingStates extends moviesHomeStates {}

class LoginSuccessStates extends moviesHomeStates {}

class LoginErrorStates extends moviesHomeStates {
  final String error;
  LoginErrorStates({required this.error});
}