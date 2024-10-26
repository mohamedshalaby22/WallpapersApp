import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Constants/constants_colors.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../../Controllers/search/search_controller.dart';
import '../../../AppWidgets/app_search_text_form_field.dart';
import '../../authentication/widgets/special_started_text.dart';

class SearchScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchScreenAppBar({super.key});

  @override
  State<SearchScreenAppBar> createState() => _SearchScreenAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(230);
}

class _SearchScreenAppBarState extends State<SearchScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 170,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          45.height,
          specialStartedText(
              title: 'Search',
              subtitle:
                  'Searching through hundreds of photos will be\n so much easier now'),
          Consumer<SearchScreenController>(
            builder: (context, value, child) => AppSearchTextFormField(
              hintText: 'Search...',
              formController: value.searchController,
              isActive: value.isActive,
              onChange: (String query) {
                if (query.isNotEmpty) {
                  value.isActive = true;
                  value.getFilteredWallpapers(query: query);
                } else {
                  value.isActive = false;
                }
                setState(() {});
              },
            ),
          ),
          30.height,
        ],
      ),
      bottom: TabBar(
        enableFeedback: true,
        labelStyle: const TextStyle(fontSize: 16),
        labelColor: ConstantsColors.primaryColor,
        unselectedLabelColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        indicatorColor: ConstantsColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.grey.shade300,
        indicatorWeight: 2,
        tabs: const [
          Tab(text: 'Photo'),
          Tab(text: 'Category'),
          Tab(text: 'Author'),
        ],
      ),
    );
  }
}
