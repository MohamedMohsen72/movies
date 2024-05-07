import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/features/view_model/home_cubit.dart';
import 'package:netfliex/features/view_model/home_states.dart';
import 'package:netfliex/models/recommendations_model.dart';



class MoreLikeThis extends StatefulWidget {
  // final List<Movie> similarMovies;
final int movieId;
  const MoreLikeThis({Key? key, required this.movieId, }) : super(key: key);

  @override
  State<MoreLikeThis> createState() => _MoreLikeThisState();
}

class _MoreLikeThisState extends State<MoreLikeThis> {
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<moviesCubit>().getmoviesrecommendations(widget.movieId );
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<moviesCubit, moviesHomeStates>(
        builder: (BuildContext context, state)
    {
      if (state is moviesrecommendationsErrorStates) {
        return Center(child: Text(state.error));
      } else if (state is moviesrecommendationsSuccessStates) {
        RecommendationsModel movies = state.model;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'MoreLikeThis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 200, // ارتفاع العنصر
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.results!.length,
                itemBuilder: (context, index) {
                  var moviesItem = RecommendationsModel().results?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120, // عرض العنصر
                          height: 160, // ارتفاع العنصر
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image:NetworkImage('$urlImage${moviesItem?.posterPath}'
                                  ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'hhhh',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight
                              .bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
      return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [const Center(child: CircularProgressIndicator())]);
    });
  }
}

// class Movie {
//   final String title;
//   final String posterUrl;
//
//   const Movie({required this.title, required this.posterUrl});
// }
//
// class MovieCard extends StatelessWidget {
//   final Movie movie;
//
//   const MovieCard({Key? key, required this.movie}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 120, // عرض العنصر
//             height: 160, // ارتفاع العنصر
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               image: DecorationImage(
//                 image: AssetImage('assets/logo2.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Text(
//             'hhhh',
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
