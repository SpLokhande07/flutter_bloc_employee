// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'employee_bloc.dart';

class EmployeeState extends Equatable {

const EmployeeState({this.allEmployee = const <Employee>[]});
final List<Employee> allEmployee;
@override 
List<Object> get props => [allEmployee];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allEmployee': allEmployee.map((x) => x.toMap()).toList(),
    };
  }

  factory EmployeeState.fromMap(Map<String, dynamic> map) {
    return EmployeeState(
      allEmployee: List<Employee>.from((map['allEmployee'] as List<int>).map<Employee>((x) => Employee.fromMap(x as Map<String,dynamic>),),),
    );
  }
}

class EmployeeInitial extends EmployeeState {}
