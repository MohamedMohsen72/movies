import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/features/Details/view_model/details_model.dart';
import 'package:netfliex/features/view_model/home_cubit.dart';
import 'package:netfliex/features/view_model/home_states.dart';



class CoustomDetails extends StatefulWidget {
  final int movieId;
  const CoustomDetails({
    super.key,
    required this.movieId,
  });

  @override
  State<CoustomDetails> createState() => _CoustomDetailsState();
}

class _CoustomDetailsState extends State<CoustomDetails> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<moviesCubit, moviesHomeStates>(
        builder: (BuildContext context, state) {
      if (state is moviesDetailsErrorStates) {
        return Center(child: Text(state.error));
      } else if (state is moviesDetailsSuccessStates) {
        DetailsModel movies = state.model;
        //
        // String genresTexe =
        // movies.genres!.map((genre) => genre.name).join(',');
        return Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('$urlImage${movies.poster_path}'),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.whiteColor.withOpacity(0.7),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                Text(movies.name.toString(), style: getTextTitle(fontSize: 23)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        movies.date!.split("-").first.toString(),
                        style: getTextsmall(),
                      ),
                      Gap(25),
                      // Text(
                      //   genresTexe,
                      //   style: getTextsmall(),
                      // ),
                    ],
                  ),
                ),
                Gap(25),
                Text(
                  movies.overview.toString(),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: getTextsmall(),
                ),
                //
              ],
            ),
          )
        ]);
      }
      return Padding(
        padding: const EdgeInsets.only(top: 150),
        child: const Center(
            child: CircularProgressIndicator(
          color: Colors.red,
          strokeAlign: 5,
          strokeWidth: 5,
        )),
      );
    });
  }
}
