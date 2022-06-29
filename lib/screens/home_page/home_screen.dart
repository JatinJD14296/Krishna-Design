import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/appbar_widget.dart';
import 'package:krishna_design/common/widgets/icon_and_images.dart';
import 'package:krishna_design/common/widgets/list_container.dart';
import 'package:krishna_design/common/widgets/padding_margin.dart';
import 'package:krishna_design/common/widgets/progras_indicator.dart';
import 'package:krishna_design/common/widgets/space_and_dividers.dart';
import 'package:krishna_design/common/widgets/text_and_styles.dart';
import 'package:krishna_design/networks/db_data.dart';
import 'package:krishna_design/screens/home_page/home_screen_bloc.dart';
import 'package:krishna_design/screens/home_page/home_screen_widget.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/navigator_route.dart';
import 'package:krishna_design/utils/screen_utils.dart';
import 'package:krishna_design/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    homepageBloc.getCategoriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context,title: txtCategories),
      floatingActionButton: FloatingActionButton(
        backgroundColor: iconTextColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddCategory(),
          );
        },
        child: icons(
          icon: Icons.add,
          color: darkTextColor,
        ),
      ),
      body: Padding(
        padding: paddingOnly(top: 20.0),
        child: StreamBuilder<List<String>>(
          stream: homepageBloc.categoriesListStream,
          builder: (context, snapshot) {
            return (snapshot.hasData)
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => listItem(
                        label: snapshot.data![index],
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            subcategoryScreen,
                            arguments: snapshot.data![index],
                          );
                        }),
                  )
                : circularIndicator;
          },
        ),
      ),
    );
  }
}
