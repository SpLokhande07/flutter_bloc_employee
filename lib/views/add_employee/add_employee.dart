import 'package:employee_ri/utils/responsive_layout.dart';
import 'package:employee_ri/views/add_employee/mobile_add_employee.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileAddEmployee(),
    );
  }
}