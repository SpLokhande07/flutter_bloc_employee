import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/global.dart';
import 'package:employee_ri/model/employee.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/utils/toast.dart';
import 'package:employee_ri/widgets/calender/calender_header.dart';
import 'package:employee_ri/widgets/text_widget.dart';
import 'package:employee_ri/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class MobileAddEmployee extends StatefulWidget {
  final bool isEdit;
  final Employee employee;
  MobileAddEmployee(
      {super.key, this.isEdit = false, this.employee = const Employee()});

  @override
  State<MobileAddEmployee> createState() => _MobileAddEmployeeState();
}

class _MobileAddEmployeeState extends State<MobileAddEmployee> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController selectRoleCtrl =
      TextEditingController(text: "Select Role");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEdit) {
      nameCtrl.text = widget.employee.name!;
      startDateCtrl.text = widget.employee.startDate!;
      endDateCtrl.text = widget.employee.endDate ?? "";
      selectRoleCtrl.text = widget.employee.role!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(builder: (context, state) {
      var bloc = context.read<EmployeeBloc>();
      return Scaffold(
        appBar: AppBar(
          title: const CustomText(
              title: "Add Employee Details", color: Colors.white),
          backgroundColor: kAppBarColor,
          centerTitle: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                          controller: nameCtrl,
                          hint: "Employee name",
                          onChanged: (value) =>
                              bloc.add(NameChanged(name: value)),
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
                        height: Global.height * 0.025,
                      ),
                      SizedBox(
                        width: Global.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DateTextField(
                              controller: startDateCtrl,
                              isEnabled: !widget.isEdit,
                              width: Global.width * 0.4,
                              prefixIcon: 'asset/emp_date.png',
                              hint: 'Today',
                            ),
                            Image.asset(
                              'asset/arrow_right.png',
                            ),
                            DateTextField(
                              controller: endDateCtrl,
                              isEnabled: state.employee.startDate != null &&
                                  state.employee.startDate!.isNotEmpty,
                              isEndDate: true,
                              width: Global.width * 0.4,
                              prefixIcon: 'asset/emp_date.png',
                              hint: 'No date',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                  height: 5,
                  thickness: 1,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
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
                        if (bloc.state.employee.name == null) {
                          showToast(
                            msg: "Employee name cannot be empty",
                          );
                        } else if (bloc.state.employee.role == null) {
                          showToast(
                            msg: "Employee role cannot be empty",
                          );
                        }
                        // else if (widget.isEdit &&
                        //     (bloc.state.employee.endDate == null ||
                        //         (bloc.state.employee.endDate != null &&
                        //             bloc.state.employee.endDate!
                        //                     .toLowerCase() ==
                        //                 "no date") ||
                        //         (bloc.state.employee.endDate != null &&
                        //             bloc.state.employee.endDate!.isEmpty))) {
                        //   showToast(
                        //     msg: "Select Date",
                        //   );
                        // }
                        else if (bloc.state.employee.startDate == null) {
                          showToast(
                            msg: "Date cannot be empty",
                          );
                        } else {
                          if (widget.isEdit) {
                            bloc.add(
                                UpdateEmployee(employee: bloc.state.employee));
                          } else {
                            bloc.add(
                                AddEmployee(employee: bloc.state.employee));
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: ShadowButton(
                        isSelected: true,
                        title: "Save",
                        width: MediaQuery.sizeOf(context).width * 0.175,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
