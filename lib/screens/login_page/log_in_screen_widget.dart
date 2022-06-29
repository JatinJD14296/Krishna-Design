import 'package:flutter/material.dart';
import 'package:krishna_design/common/validation/validation_stream_controller.dart';
import 'package:krishna_design/common/widgets/buttons.dart';
import 'package:krishna_design/common/widgets/field_and_label.dart';
import 'package:krishna_design/common/widgets/icon_and_images.dart';
import 'package:krishna_design/common/widgets/padding_margin.dart';
import 'package:krishna_design/common/widgets/space_and_dividers.dart';
import 'package:krishna_design/common/widgets/text_and_styles.dart';
import 'package:krishna_design/utils/colors.dart';
import 'package:krishna_design/utils/images.dart';
import 'package:krishna_design/utils/screen_utils.dart';
import 'package:krishna_design/utils/strings.dart';

Widget logoWidget = Center(child: Images.instance
    .assetImage(name: appLogo, height: Screen.screenHeight * 0.4),);

Widget welcome = labels(
  text: txtWelcomeBack,
  color: darkTextColor,
  fontWeight: FontWeight.w600,
  size: 26.0,
);
Widget loginContinue = labels(
  text: txtLoginToContinue,
  color: darkTextColor,
  fontWeight: FontWeight.w400,
  size: 14.0,
);

Widget forgotPass(context, {required Function onTap}) => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ForgotPassword(),
            );
          },
          child: labels(
            text: txtForgotPassword,
            color: hintColor,
            size: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );

class ForgotPassword extends StatefulWidget {
  const
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  String emailErrorMsg = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: paddingAll(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      children: [
        FieldAndLabel(
          labelValue: txtEmailAddress,
          hint: txtEnterEmail,
          inputType: TextInputType.emailAddress,
          controller: emailController,
          validationMessage: emailErrorMsg,
          fillColor: white,
          leftIcon: icons(icon: Icons.email_outlined, color: iconTextColor),
          onChanged: (value) {
            setState(() {
              emailErrorMsg = emailValidationMsg(value);
            });
          },
        ),
        verticalSpace(20.0),
        submitButton(
          text: '',
          width: 50,
          onPressed: () async {
            /*try {
              await auth
                  .sendPasswordResetEmail(email: emailController.text)
                  .then((value) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: labels(text: 'Please check your mail for reset password', color: white),
                  ),
                );
              });
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: labels(text: 'User Not Define...', color: white),
                ),
              );
            }*/
          },
        ),
      ],
    );
  }
}
