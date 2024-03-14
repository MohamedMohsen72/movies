import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/models/details_model.dart';
import 'package:netfliex/view/view_model/home_cubit.dart';
import 'package:netfliex/view/view_model/home_states.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.movieId});
  final int movieId;
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<moviesCubit>().getmoviesDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<moviesCubit, moviesHomeStates>(
          builder: (BuildContext context, state) {
        if (state is moviesDetailsErrorStates) {
          return Text(state.error);
        } else if (state is moviesDetailsSuccessStates) {
          DetailsModel movies = state.model;
          return Column(children: [
            Stack(
              children: [
                Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('$urlImage${movies.posterPath}'))),)
              ],
            )
          ]);
        }
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [const Center(child: CircularProgressIndicator())]);
      }),
    );
  }
}
