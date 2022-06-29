import 'package:flutter/material.dart';
import 'package:krishna_design/common/widgets/buttons.dart';
import 'package:krishna_design/common/widgets/field_and_label.dart';
import 'package:krishna_design/common/widgets/padding_margin.dart';
import 'package:krishna_design/common/widgets/space_and_dividers.dart';
import 'package:krishna_design/screens/subcategory_page/subcategory_screen_bloc.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/strings.dart';

class AddSubcategory extends StatefulWidget {
  final String category;

  const AddSubcategory({this.category = '', Key? key}) : super(key: key);

  @override
  _AddSubcategoryState createState() => _AddSubcategoryState();
}

class _AddSubcategoryState extends State<AddSubcategory> {
  TextEditingController subcategoryController = TextEditingController();

  String subcategoryErrorMsg = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: paddingAll(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      children: [
        FieldAndLabel(
          labelValue: txtSubcategory,
          hint: txtEnterSubcategory,
          inputType: TextInputType.emailAddress,
          controller: subcategoryController,
          validationMessage: subcategoryErrorMsg,
          fillColor: white,
          onChanged: (val) {
            setState(() {
              subcategoryErrorMsg = val.isEmpty ? txtEnterSubcategory : '';
            });
          },
        ),
        verticalSpace(20.0),
        submitButton(
          text: txtSubmit,
          textColor: darkTextColor,
          onPressed: () {
            setState(() {
              subcategoryController.text.trim().isEmpty
                  ? subcategoryErrorMsg = txtEnterSubcategory
                  : {
                      subcategoryPageBloc.getSubcategoryList(
                        data: subcategoryController.text,
                        categoryType: widget.category,
                      ),
                      Navigator.pop(context)
                    };
            });
          },
        ),
      ],
    );
  }
}
