import 'package:employee_ri/model/employee.dart';
import 'package:employee_ri/views/add_employee/mobile_add_employee.dart';
import 'package:employee_ri/widgets/responsive_layout/responsive_layout.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  final bool isEdit;
  final Employee employee;
  AddEmployeeScreen(
      {super.key, this.isEdit = false, this.employee = const Employee()});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileAddEmployee(
        isEdit: widget.isEdit,
        employee: widget.employee,
      ),
    );
  }
}
