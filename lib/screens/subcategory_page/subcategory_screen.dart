import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/appbar_widget.dart';
import 'package:krishna_design/common/widgets/icon_and_images.dart';
import 'package:krishna_design/common/widgets/list_container.dart';
import 'package:krishna_design/common/widgets/padding_margin.dart';
import 'package:krishna_design/common/widgets/progras_indicator.dart';
import 'package:krishna_design/screens/subcategory_page/subcategory_screen_bloc.dart';
import 'package:krishna_design/screens/subcategory_page/subcategory_screen_widget.dart';
import 'package:krishna_design/utils/colors.dart';

class SubcategoryScreen extends StatefulWidget {
  const SubcategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    selectedCategory = ModalRoute.of(context)!.settings.arguments as String;
    subcategoryPageBloc.getSubcategoryList(categoryType: selectedCategory);

    return Scaffold(
      appBar: appbar(
        context,
        title: selectedCategory,
        leadingIcon: Icons.arrow_back,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: iconTextColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddSubcategory(
              category: selectedCategory,
            ),
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
          stream: subcategoryPageBloc.subcategoryListStream,
          builder: (context, snapshot) {
            return (snapshot.hasData)
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        listItem(label: snapshot.data![index], onTap: () {}),
                  )
                : circularIndicator;
          },
        ),
      ),
    );
  }
}
