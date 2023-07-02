import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/global.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/widgets/calender/calender_header.dart';
import 'package:employee_ri/widgets/custom_date_picker.dart';
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
  final double? width;
  final double? height;
  final ValueChanged<String>? onChanged;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isEnabled = true,
      this.maxLength,
      this.width,
      this.onChanged,
      this.height,
      this.maxLines});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? Global.width,
      height: widget.height ?? Global.height * 0.05,
      child: TextField(
        enabled: widget.isEnabled,
        controller: widget.controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged!,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
                color: widget.isEnabled ?? true
                    ? kHintColor
                    : kTextFieldBorderColor),
            labelStyle: TextStyle(color: kTextFieldBorderColor),
            prefixIcon: Image.asset(widget.prefixIcon),
            suffixIcon: widget.suffixIcon == null
                ? null
                : Icon(widget.suffixIcon,
                    color: kIconColor, size: Global.height * 0.05),
            contentPadding: const EdgeInsets.all(8),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE5E5E5)))),
// controller: widget.controller,
      ),
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
  final double? width;
  final double? height;
  const DropDownTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isEnabled = true,
      this.maxLength,
      this.width,
      this.height,
      this.maxLines});

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? Global.width,
      height: widget.height ?? Global.height * 0.05,
      child: TextField(
        enabled: widget.isEnabled,
        controller: widget.controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        keyboardType: TextInputType.none,
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
      ),
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
                      context
                          .read<EmployeeBloc>()
                          .add(RoleChanged(role: role.text));
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
  final double? width;
  final double? height;
  final bool? isEnabled;
  final bool isEndDate;
  const DateTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.prefixIcon,
      this.suffixIcon,
      this.isEnabled = true,
      this.maxLength,
      this.width,
      this.height,
      this.isEndDate = false,
      this.maxLines});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? Global.width,
      height: widget.height ?? Global.height * 0.05,
      child: TextField(
        enabled: widget.isEnabled,
        keyboardType: TextInputType.none,
        controller: widget.controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        onTap: () {
          // if (widget.isEnabled! ||
          //     (context.read<EmployeeBloc>().state.employee!.startDate != null &&
          //         context
          //             .read<EmployeeBloc>()
          //             .state
          //             .employee!
          //             .startDate!
          //             .isNotEmpty)) {
          //   showDatePicker(widget.controller);
          // }
          if (widget.isEnabled!) showDatePicker(widget.controller);
        },
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
                color: widget.isEnabled ?? true ? kHintColor : kHintColor),
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
      ),
    );
  }

  showDatePicker(TextEditingController controller) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (dialogContext) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            contentPadding: const EdgeInsets.all(16),
            content: BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
              return Container(
                width: Global.width,
                height: Global.height * 0.7,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: Global.height * 0.6,
                        child: CustomDatePicker(
                          isEndDate: widget.isEndDate,
                          controller: widget.controller,
                        )),
                    Divider(
                      color: Colors.grey.withOpacity(0.2),
                      height: 5,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('asset/emp_date.png'),
                            // CustomText(title: widget.controller.text)
                            CustomText(
                                title: widget.isEndDate
                                    ? state.employee.endDate ?? ""
                                    : state.employee.startDate ?? "")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (widget.isEndDate) {
                                  state.employee.copyWith(startDate: "");
                                } else {
                                  state.employee.copyWith(endDate: "");
                                }
                                Navigator.pop(context);
                              },
                              child: ShadowButton(
                                width: MediaQuery.sizeOf(context).width * 0.175,
                                isSelected: false,
                                title: "Cancel",
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.text = widget.isEndDate
                                    ? state.employee.endDate != null
                                        ? state.employee.endDate!
                                        : ""
                                    : state.employee.startDate!;
                                Navigator.pop(context);
                              },
                              child: ShadowButton(
                                isSelected: true,
                                title: "Save",
                                width: MediaQuery.sizeOf(context).width * 0.175,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          );
        });
  }
}
