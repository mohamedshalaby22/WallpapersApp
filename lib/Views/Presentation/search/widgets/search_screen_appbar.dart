import 'package:flutter/material.dart';
import 'package:wallpapers_app/Constants/constants_colors.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../AppWidgets/app_search_text_form_field.dart';
import '../../authentication/widgets/special_started_text.dart';

class SearchScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchScreenAppBar({super.key});

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
          AppSearchTextFormField(
            hintText: 'Search...',
            formController: TextEditingController(),
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

  @override
  Size get preferredSize => const Size.fromHeight(230);
}
