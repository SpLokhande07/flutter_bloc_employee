import 'package:employee_ri/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const ResponsiveLayout({Key? key, this.mobile, this.desktop, this.tablet})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraint) {
      Global.height = constraint.maxHeight;
      Global.width = constraint.maxWidth;
      if (kDebugMode) {
        print(constraint);
      }
      if (constraint.maxWidth <= 500) {
        return widget.mobile!;
      } else if (constraint.maxWidth <= 1100) {
        return widget.tablet!;
      } else {
        return widget.desktop!;
      }
    });
  }
}
