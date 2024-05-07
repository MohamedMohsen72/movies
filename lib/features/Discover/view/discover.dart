import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';

import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/features/Details/view/details_view.dart';


import 'package:netfliex/features/view_model/home_cubit.dart';
import 'package:netfliex/features/view_model/home_states.dart';

class Newview extends StatefulWidget {
  const Newview({Key? key});

  @override
  State<Newview> createState() => _NewviewState();
}

class _NewviewState extends State<Newview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = BlocProvider.of<moviesCubit>(context);
    cubit.getmoviesbyNowplay();

  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<moviesCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Discover ',
          style: getTextTitle(fontWeight: FontWeight.bold),
        ),
      ),

      body:
      BlocBuilder<moviesCubit, moviesHomeStates>(
        builder: (context, state) {
      if (state is moviesbyNowplayLoadingStates) {
        return const Center(child: CircularProgressIndicator(color: Colors.red,strokeAlign: 5,strokeWidth: 5,));
      }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 25,
              ),
              itemCount: cubit.Nowplaying.results!.length,
              itemBuilder: (BuildContext context, int index) {
                var moviesitem =cubit.Nowplaying.results?[index];
                return
                  InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsView(movieId:moviesitem.id??0),));
                  },

                  child: Column(
                    children: [

                      Expanded(
                        child: Image.network(
                          '$urlImage${moviesitem!.posterPath}',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap(15),
                      Text(
                        moviesitem!.title??'',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );

        },
      ),
    );
  }
}
