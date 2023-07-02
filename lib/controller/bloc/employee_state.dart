// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'employee_bloc.dart';

class EmployeeState extends Equatable {
  const EmployeeState(
      {this.allEmployee = const <Employee>[],
      this.employee = const Employee()});
  final Employee employee;
  final List<Employee> allEmployee;

  @override
  List<Object> get props => [allEmployee, employee];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allEmployee': allEmployee.map((x) => x.toMap()).toList(),
    };
  }

  factory EmployeeState.fromMap(Map<String, dynamic> map) {
    return EmployeeState(
      allEmployee: List<Employee>.from(
        (map['allEmployee'] as List<dynamic>)
            .map<Employee>((e) => Employee.fromMap(e as Map<String, dynamic>)),
      ),
    );
  }

  EmployeeState copyWith({
    Employee? employee,
    List<Employee>? allEmployee,
  }) {
    return EmployeeState(
      employee: employee ?? this.employee,
      allEmployee: allEmployee ?? this.allEmployee,
    );
  }
}

class EmployeeInitial extends EmployeeState {}
