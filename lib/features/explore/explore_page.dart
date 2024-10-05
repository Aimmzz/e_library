import 'package:e_library/constant/color_values.dart';
import 'package:e_library/widgets/header_explore.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsValues.backgroundApp,
      body: SafeArea(
        child: Column(
          children: [
            HeaderExplore()
          ],
        )
      ),
    );
  }
}