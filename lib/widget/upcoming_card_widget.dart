import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfliex/core/constants/app_constant.dart';
import 'package:netfliex/core/constants/constant.dart';

import 'package:netfliex/models/UpcomingModel.dart';
import 'package:netfliex/view/view_model/home_cubit.dart';
import 'package:netfliex/view/view_model/home_states.dart';

import '../core/Utils/text_styles.dart';

class UpcomingCard extends StatelessWidget {
  UpcomingCard({
    super.key,
    required this.headlinText, required this.upcomingModel,
  });
  final String headlinText;
  final UpcomingModel upcomingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                headlinText,
                style: getTextTitle(),
              ),
            ],
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              itemCount: upcomingModel.results.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var moviesItem = upcomingModel.results?[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '$urlImage${moviesItem!.posterPath}'),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

  }
}
