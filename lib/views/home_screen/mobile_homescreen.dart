import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/global.dart';
import 'package:employee_ri/model/employee.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/views/add_employee/add_employee.dart';
import 'package:employee_ri/views/home_screen/employee_list.dart';
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
            backgroundColor: kAppBarColor,
            title:
                const CustomText(title: "Employee List", color: Colors.white),
          ),
          body: employeeList.isEmpty
              ? const NoEmployee()
              : SizedBox(
                  width: Global.width,
                  height: Global.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        listTitle("Current employees"),
                        Flexible(
                          fit: FlexFit.loose,
                          child: EmployeeList(
                            employeeList: employeeList,
                            isCurrent: true,
                          ),
                        ),
                        listTitle("Previous employees"),
                        Flexible(
                          fit: FlexFit.loose,
                          child: EmployeeList(
                            employeeList: employeeList,
                            isCurrent: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (_) => MobileAddEmployee()));
                  MaterialPageRoute(builder: (context) => AddEmployeeScreen()));
            },
            backgroundColor: kIconColor,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget listTitle(String title) {
    return Container(
      color: kSubtitleColor.withOpacity(0.3),
      width: Global.width,
      height: Global.height * 0.075,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomText(
            title: title,
            color: kHeadingColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
