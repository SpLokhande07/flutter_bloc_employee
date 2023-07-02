import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/model/employee.dart';
import 'package:employee_ri/utils/constants.dart';
import 'package:employee_ri/views/add_employee/add_employee.dart';
import 'package:employee_ri/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  final bool isCurrent;
  final List<Employee> employeeList;
  const EmployeeList(
      {super.key, required this.employeeList, this.isCurrent = false});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(builder: (context, state) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.employeeList.length,
        itemBuilder: (_, index) {
          return widget.isCurrent
              ? widget.employeeList[index].endDate == null ||
                      (widget.employeeList[index].endDate != null &&
                          widget.employeeList[index].endDate!.isEmpty)
                  ? Dismissible(
                      background: Container(
                          color: kDeleteColor,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.delete,
                                color: kDismissColor,
                              ),
                            ),
                          )),
                      direction: DismissDirection.endToStart,
                      key: Key(widget.employeeList[index].id!),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          context.read<EmployeeBloc>().add(DeleteEmployee(
                              employee: widget.employeeList[index]));
                        }
                      },
                      child: ListTile(
                        onTap: () {
                          context.read<EmployeeBloc>().add(PopulateEmployee(
                              employee: widget.employeeList[index]));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddEmployeeScreen(
                                        isEdit: true,
                                        employee: widget.employeeList[index],
                                      )));
                        },
                        contentPadding: const EdgeInsets.all(16),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: CustomText(
                            title: widget.employeeList[index].name!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: CustomText(
                                title: widget.employeeList[index].role!,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kSubtitleColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: CustomText(
                                title: widget.employeeList[index].startDate!,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kSubtitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()
              : widget.employeeList[index].endDate != null &&
                      widget.employeeList[index].endDate!.isNotEmpty
                  ? ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: CustomText(
                          title: widget.employeeList[index].name!,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: CustomText(
                              title: widget.employeeList[index].role!,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kSubtitleColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: CustomText(
                              title: widget.employeeList[index].startDate!,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kSubtitleColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox();
        },
        separatorBuilder: (BuildContext context, int index) {
          return widget.isCurrent
              ? widget.employeeList[index].endDate == null ||
                      (widget.employeeList[index].endDate != null &&
                          widget.employeeList[index].endDate!.isEmpty)
                  ? Divider(
                      color: Colors.grey.withOpacity(0.2),
                      height: 5,
                      thickness: 1,
                    )
                  : const SizedBox()
              : widget.employeeList[index].endDate != null
                  ? Divider(
                      color: Colors.grey.withOpacity(0.2),
                      height: 5,
                      thickness: 1,
                    )
                  : const SizedBox();
        },
      );
    });
  }
}
