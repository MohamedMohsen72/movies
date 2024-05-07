

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/features/Details/view/details_view.dart';

import 'package:netfliex/features/search/view_model/search_model.dart';
import 'package:netfliex/features/view_model/home_cubit.dart';
import 'package:netfliex/features/view_model/home_states.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<moviesCubit, moviesHomeStates>(
      builder: (context, state) {
        if (state is moviesBysearchErrorStates) {
          return Text(state.error);
        } else if (state is moviesBysearchSuccessStates) {
          SearchModel movies = state.model;
          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Total Results : ${movies.results?.length}',
                      style: getTextTitle(fontSize: 20),
                    ),
                  ],
                ),
                Gap(15),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: movies.results?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var moviesitem = movies.results?[index];
                      return InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsView(movieId:moviesitem.id ),));
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
                              moviesitem.title,
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
                  ),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 250),
            child: const Center(child: CircularProgressIndicator(color: Colors.red,strokeAlign: 5,strokeWidth: 5,),),
          );
        }
      },
    );
  }
}
