import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/features/Details/view/widget/coustom_details.dart';
import 'package:netfliex/features/view_model/home_cubit.dart';


class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.movieId});
  final int movieId;
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<moviesCubit>().getmoviesDetails(widget.movieId );

  }


  @override
  Widget build(BuildContext context) {
    // final cubit = context.watch<moviesCubit>();
    print(widget.movieId);
    return Scaffold(
      body: CoustomDetails(movieId: widget.movieId,),

      // MoreLikeThis(movieId:widget.movieId)
    );
  }
}
