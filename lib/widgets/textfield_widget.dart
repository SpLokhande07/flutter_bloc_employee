import 'package:employee_ri/global.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool? isEnabled;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isEnabled = true,
      this.maxLength,
      this.maxLines});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: widget.isEnabled ?? true
                  ? kHintColor
                  : kTextFieldBorderColor),
          labelStyle: TextStyle(color: kTextFieldBorderColor),
          prefixIcon: Image.asset('${widget.prefixIcon}'),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Icon(widget.suffixIcon,
                  color: kIconColor, size: Global.height * 0.05),
          contentPadding: const EdgeInsets.all(8),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE5E5E5)))),
// controller: widget.controller,
    );
  }
}

class DropDownTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool? isEnabled;
  const DropDownTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isEnabled = true,
      this.maxLength,
      this.maxLines});

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      onTap: () {
        showBottomOptions(widget.controller);
      },
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: widget.isEnabled ?? true
                  ? kHintColor
                  : kTextFieldBorderColor),
          labelStyle: TextStyle(color: kTextFieldBorderColor),
          prefixIcon: Image.asset(widget.prefixIcon, color: kIconColor),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Icon(widget.suffixIcon,
                  color: kIconColor, size: Global.height * 0.05),
          contentPadding: const EdgeInsets.all(8),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE5E5E5)))),
// controller: widget.controller,
    );
  }

  showBottomOptions(TextEditingController role) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: Global.height * 0.275,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: ListView.separated(
                itemCount: Global.employeeRole.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      role.text = Global.employeeRole[i];
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: Global.height * 0.05,
                      child: Center(
                          child: CustomText(
                        title: Global.employeeRole[i].toString(),
                      )),
                    ),
                  );
                },
                separatorBuilder: (_, i) {
                  return i == Global.employeeRole.length - 1
                      ? SizedBox(
                          height: Global.height * 0.05,
                        )
                      : Divider(
                          color: kHintColor,
                          thickness: 2,
                        );
                }),
          );
        });
  }
}

class DateTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool? isEnabled;
  const DateTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isEnabled = true,
      this.maxLength,
      this.maxLines});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      onTap: () {
        showBottomOptions(widget.controller);
      },
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: widget.isEnabled ?? true
                  ? kHintColor
                  : kTextFieldBorderColor),
          labelStyle: TextStyle(color: kTextFieldBorderColor),
          prefixIcon: Image.asset("${widget.prefixIcon}", color: kIconColor),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Icon(widget.suffixIcon,
                  color: kIconColor, size: Global.height * 0.05),
          contentPadding: const EdgeInsets.all(8),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE5E5E5)))),
// controller: widget.controller,
    );
  }

  showBottomOptions(TextEditingController role) {
    return showDialog(
        context: context,
        builder: (dialogContext) {
          return DatePickerDialog(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now());
        });
  }
}
