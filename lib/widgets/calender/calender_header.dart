import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ShadowButton extends StatefulWidget {
  final bool isSelected;
  final String title;
  final double? width;
  final double? height;
  const ShadowButton(
      {super.key,
      required this.isSelected,
      required this.title,
      this.height,
      this.width});

  @override
  State<ShadowButton> createState() => _CalenderHeadersState();
}

class _CalenderHeadersState extends State<ShadowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? MediaQuery.sizeOf(context).width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.isSelected ? kButtonColor : Colors.transparent,
            boxShadow: widget.isSelected
                ? null
                : [BoxShadow(color: kButtonColor.withOpacity(0.2))]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: CustomText(
              title: widget.title,
              color: widget.isSelected ? kPrimaryColor : kButtonColor,
            ),
          ),
        ));
  }
}
