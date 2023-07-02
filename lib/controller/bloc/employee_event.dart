// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

// class InitialState extends EmployeeEvent {
//   final Employee employee;
//   const InitialState({
//     required this.employee,
//   });
// }

class AddEmployee extends EmployeeEvent {
  final Employee employee;
  const AddEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}

class UpdateEmployee extends EmployeeEvent {
  final Employee employee;
  const UpdateEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}

class PopulateEmployee extends EmployeeEvent {
  final Employee employee;
  const PopulateEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}

class DeleteEmployee extends EmployeeEvent {
  final Employee employee;
  const DeleteEmployee({
    required this.employee,
  });

  @override
  List<Object> get props => [employee];
}

class NameChanged extends EmployeeEvent {
  final String name;
  const NameChanged({
    required this.name,
  });
}

class RoleChanged extends EmployeeEvent {
  final String role;
  const RoleChanged({
    required this.role,
  });
}

class StartDateChanged extends EmployeeEvent {
  final String startDate;
  const StartDateChanged({
    required this.startDate,
  });
}

class EndDateChanged extends EmployeeEvent {
  final String endDate;
  const EndDateChanged({
    required this.endDate,
  });
}
