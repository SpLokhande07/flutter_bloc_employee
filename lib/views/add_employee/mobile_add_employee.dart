import 'package:employee_ri/global.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/widgets/text_widget.dart';
import 'package:employee_ri/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class MobileAddEmployee extends StatefulWidget {
  const MobileAddEmployee({super.key});

  @override
  State<MobileAddEmployee> createState() => _MobileAddEmployeeState();
}

class _MobileAddEmployeeState extends State<MobileAddEmployee> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController selectRoleCtrl =
        TextEditingController(text: "Select Role");
    TextEditingController startDateCtrl = TextEditingController(text: "Today");
    TextEditingController endDateCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(title: "Add Employee Details"),
        backgroundColor: kAppBarColor,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
                controller: nameCtrl,
                hint: "Employee name",
                prefixIcon: 'asset/emp_person.png'),
            SizedBox(
              height: Global.height * 0.025,
            ),
            DropDownTextField(
              controller: selectRoleCtrl,
              hint: "",
              prefixIcon: 'asset/emp_person.png',
              suffixIcon: Icons.arrow_drop_down_rounded,
            ),
            SizedBox(
              width: Global.width,
              child: Row(
                children: [
                  DateTextField(
                    controller: startDateCtrl,
                    prefixIcon: 'asset/emp_person.png',
                    hint: 'Today',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
