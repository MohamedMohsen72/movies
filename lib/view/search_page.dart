import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/view/view_model/home_cubit.dart';
import 'package:netfliex/widget/coustom_listview.dart';
import 'package:netfliex/widget/navbar.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          'Find Your News',
          style: TextStyle(
            color: AppColor.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            style: TextStyle(color: AppColor.whiteColor),
            onChanged: (value) {
               context.read<moviesCubit>().getmoviesSearch(value);
            },
            decoration: InputDecoration(
              fillColor: AppColor.conColor,
              filled: true,
              hintText: 'Search for news',
              hintStyle: TextStyle(color: AppColor.greyColor),
              prefixIcon: const Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const Gap(15),
          const SearchListView()
        ]),
      ),
    );
  }
}
