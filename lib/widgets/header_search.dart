import 'package:e_library/constant/color_values.dart';
import 'package:e_library/constant/custom_size.dart';
import 'package:e_library/provider/search_provider.dart';
import 'package:e_library/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH12,
          const TextTitle(title: 'Search'),
          const Text(
            "Let's Find your books",
            style: TextStyle(
                color: ColorsValues.mainBlack,
                fontSize: TextSize.regular,
                fontWeight: FontWeight.w600),
          ),
          gapH12,
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: ColorsValues.mainBlack,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: ColorsValues.mainBlack,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: ColorsValues.mainBlack,
                  width: 2,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: ColorsValues.mainBlack,
              ),
              hintText: 'Search Book or Author...',
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (value) {
              Provider.of<SearchProvider>(context, listen: false).setSearchQuery(value);
            },
          ),
        ],
      ),
    );
  }
}
