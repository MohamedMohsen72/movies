import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/models/UpcomingModel.dart';
import 'package:netfliex/models/nowplay_model.dart';
import 'package:netfliex/services/api_services.dart';
import 'package:netfliex/view/search_page.dart';
import 'package:netfliex/view/view_model/home_cubit.dart';
import 'package:netfliex/view/view_model/home_states.dart';
import 'package:netfliex/widget/nowplay_card_widget.dart';
import 'package:netfliex/widget/upcoming_card_widget.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<moviesCubit>(context);
    cubit.moviesbyNowPlay();
    cubit.movieCategory();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<moviesCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOOVIZ',
          style: getTextTitle(
            color: Colors.red,
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator. pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
            child: Icon(
              Icons.search,
              color: AppColor.whiteColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: CircleAvatar(
              radius: 25,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<moviesCubit, moviesHomeStates>(
          builder: (context, state) {
            if (state is moviesbyNowPlayErrorStates) {
              return Text(state.error);
            } else if (state is moviesbyNowPlaySuccessStates) {
              TrendingModel movies = state.model;
              return Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: movies.results.length,
                      itemBuilder: (context, index, realIndex) {
                        var moviesItem = movies.results?[index];
                        return Container(
                            width: 320,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(
                                '$urlImage${moviesItem!.backdropPath}',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ));
                      },
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Gap(20),
                    NowPlaycard(
                        headlinText: 'Trending', trendingmodel: state.model),
                    UpcomingCard(
                      headlinText: 'Upcoming',
                      upcomingModel: cubit.upcomingModel,
                    ),
                  ],
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
