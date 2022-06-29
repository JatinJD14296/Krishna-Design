import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/buttons.dart';
import 'package:krishna_design/common/widgets/field_and_label.dart';
import 'package:krishna_design/common/widgets/padding_margin.dart';
import 'package:krishna_design/common/widgets/space_and_dividers.dart';
import 'package:krishna_design/screens/home_page/home_screen_bloc.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/strings.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController categoryController = TextEditingController();

  String categoryErrorMsg = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: paddingAll(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      children: [
        FieldAndLabel(
          labelValue: txtCategory,
          hint: txtEnterCategory,
          inputType: TextInputType.emailAddress,
          controller: categoryController,
          validationMessage: categoryErrorMsg,
          fillColor: white,
          onChanged: (val) {
            setState(() {
              categoryErrorMsg = val.isEmpty ? txtEnterCategory : '';
            });
          },
        ),
        verticalSpace(20.0),
        submitButton(
          text: txtSubmit,
          textColor: darkTextColor,
          onPressed: () {
            setState(() {
              categoryController.text.trim().isEmpty
                  ? categoryErrorMsg = txtEnterCategory
                  : {
                      homepageBloc.getCategoriesList(
                          data: categoryController.text),
                      Navigator.pop(context)
                    };
            });
          },
        ),
      ],
    );
  }
}
