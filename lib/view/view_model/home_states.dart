

import 'package:netfliex/models/UpcomingModel.dart';
import 'package:netfliex/models/details_model.dart';
import 'package:netfliex/models/nowplay_model.dart';
import 'package:netfliex/models/search_model.dart';

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
// //getsources
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