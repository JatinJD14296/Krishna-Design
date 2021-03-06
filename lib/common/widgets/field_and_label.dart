import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'padding_margin.dart';
import 'text_and_styles.dart';

class FieldAndLabel extends StatefulWidget {
  final Color fillColor;
  final String? labelValue;
  final int maxLine;
  final int? maxLength;
  final bool isRequire;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final bool isPassword;
  final bool readOnly;
  final String hint;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final String? validationMessage;
  final TextEditingController controller;

  const FieldAndLabel({
    Key? key,
    this.isRequire = false,
    this.readOnly = false,
    this.fillColor = white,
    this.maxLine = 1,
    this.maxLength,
    this.labelValue,
    this.onTap,
    this.onChanged,
    this.inputType,
    this.isPassword = false,
    required this.hint,
    this.rightIcon,
    this.leftIcon,
    this.validationMessage,
    required this.controller,
  }) : super(key: key);

  @override
  _FieldAndLabelState createState() => _FieldAndLabelState();
}

class _FieldAndLabelState extends State<FieldAndLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.labelValue != null ? buildLabel(context) : Container(),
        buildTextField(context),
        buildValidationMessage(context),
      ],
    );
  }

  Widget buildLabel(BuildContext context) {
    return (widget.labelValue != null && widget.labelValue!.isNotEmpty)
        ? Padding(
            padding: paddingOnly(bottom: 10.0),
            child: Row(children: <Widget>[
              labels(
                text: widget.labelValue ?? '',
                color: iconTextColor,
                size: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              if (widget.isRequire)
                Text(
                  "*",
                  style: defaultTextStyle(color: primaryColor, size: 14),
                  textAlign: TextAlign.start,
                ),
            ]),
          )
        : Container();
  }

  Widget buildTextField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: const [
          BoxShadow(
            spreadRadius: -10,
            offset: Offset(0, 2),
            blurRadius: 12,
          )
        ],
      ),
      child: TextFormField(
        keyboardType: widget.inputType,
        autofocus: false,
        obscureText: widget.isPassword ? visible : widget.isPassword,
        style: const TextStyle(
          color: iconTextColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        onChanged: widget.onChanged!,
        readOnly: widget.readOnly,
        onTap: widget.onTap ?? () {},
        maxLength: widget.maxLength,
        cursorColor: iconTextColor,
        maxLines: widget.maxLine,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: transparent),
          ),
          alignLabelWithHint: true,
          suffixIcon: widget.rightIcon,
          prefixIcon: widget.leftIcon,
          counterText: "",
          hintText: widget.hint,
          hintStyle: const TextStyle(color: hintColor),
          filled: true,
          isDense: true,
          fillColor: widget.fillColor,
        ),
      ),
    );
  }

  bool visible = true;

  Widget buildValidationMessage(BuildContext context) {
    return buildValidationErrorMessage(context,
        validationMessage: widget.validationMessage!);
  }

  bool isBlank(String value) => value == '';

  Widget buildValidationErrorMessage(BuildContext context,
      {String validationMessage = ''}) {
    return (!isBlank(validationMessage))
        ? Padding(
            padding: paddingOnly(
              left: 20,
              top: 5.0,
            ),
            child: Row(
              children: [
                Text(
                  validationMessage,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.validationMessage == "Valid"
                        ? Colors.green
                        : red,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
