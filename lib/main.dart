import 'package:e_library/constant/color_values.dart';
import 'package:e_library/features/explore/explore_page.dart';
import 'package:e_library/features/favorit/favorite_page.dart';
import 'package:e_library/features/profile/profile_page.dart';
import 'package:e_library/features/search/search_page.dart';
import 'package:e_library/provider/edit_book_provider.dart';
import 'package:e_library/provider/explorer_provider.dart';
import 'package:e_library/provider/favorite_provider.dart';
import 'package:e_library/provider/search_provider.dart';
import 'package:e_library/widgets/button_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExplorerProvider()),
        ChangeNotifierProvider(create: (_) => EditBookProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _curentIndex = 0;
  final List<Widget> _pages = [
    const ExplorePage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: ColorsValues.backgroundApp,
      body: _pages[_curentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: Colors.white,
          elevation: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonBottombar(
                icon: Icons.explore_outlined,
                title: 'Explore',
                isSelected: _curentIndex == 0,
                onTap: (){
                  onTapTapped(0);
                }
              ),
              ButtonBottombar(
                icon: Icons.search_rounded,
                title: 'Search',
                isSelected: _curentIndex == 1,
                onTap: (){
                  onTapTapped(1);
                }
              ),
              ButtonBottombar(
                icon: Icons.bookmark_border_rounded,
                title: 'Favorite',
                isSelected: _curentIndex == 2,
                onTap: (){
                  onTapTapped(2);
                }
              ),
              ButtonBottombar(
                icon: Icons.person_2_outlined,
                title: 'Profile',
                isSelected: _curentIndex == 3,
                onTap: (){
                  onTapTapped(3);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapTapped(int index) {
    setState(() {
      _curentIndex = index;
    });
  }
}