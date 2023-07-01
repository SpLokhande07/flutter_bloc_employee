import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/model/employee.dart';
import 'package:employee_ri/views/no_employee.dart';
import 'package:employee_ri/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
         List<Employee> employeeList = state.allEmployee;
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const CustomText(title: "Employee List"),
          ),
          body: employeeList.isEmpty ? NoEmployee() : 
          ListView.builder(
            itemCount: employeeList.length,
            itemBuilder: (_,index){
            return ListTile(
              title: CustomText(title: employeeList[index].name),
            );
          })
        );
      },
    );
  }
}
