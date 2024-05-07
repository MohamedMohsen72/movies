import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/features/navbar.dart';
import 'package:netfliex/features/search/view/widget/coustom_listview.dart';
import 'package:netfliex/features/view_model/home_cubit.dart';





class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => NavBar(),
              ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            )),
        centerTitle: true,
        title: Text(
          'Find Your Movie',
          style: TextStyle(
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            style: TextStyle(color: AppColor.balckColor),
            onChanged: (value) {
               context.read<moviesCubit>().getmoviesSearch(value);
            },
            decoration: InputDecoration(
              // fillColor: AppColor.conColor,

              hintText: 'Search for movies',
              hintStyle: TextStyle(color: AppColor.balckColor),
              prefixIcon: const Icon(Icons.search),

              ),
            ),

          const Gap(15),
          const SearchListView()
        ]),
      ),
    );
  }
}
