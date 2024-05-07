import 'package:flutter/material.dart';

import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/constants/constant.dart';
import 'package:netfliex/features/Details/view/details_view.dart';

import 'package:netfliex/features/home/view_model/trending_model.dart';


class NowPlaycard extends StatelessWidget {
  const NowPlaycard({super.key, required this.headlinText, required this.trendingmodel});
  final String headlinText;
  final TrendingModel trendingmodel;

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
            height: 220,
            child: ListView.builder(
              itemCount:trendingmodel .results.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var moviesItem = trendingmodel.results?[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsView(movieId: moviesItem.id,),));
                  },
                    child: Container(
                      height: 220,
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
