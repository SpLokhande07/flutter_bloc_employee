import 'package:employee_ri/controller/bloc_exports.dart';
import 'package:employee_ri/model/employee.dart';
import 'package:equatable/equatable.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends HydratedBloc<EmployeeEvent, EmployeeState> {
  static List<Employee> allEmployee = [];
  EmployeeBloc() : super(EmployeeInitial()) {
    on<AddEmployee>(_onAddEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);
    on<NameChanged>(_onNameChanged);
    on<RoleChanged>(_onRoleChanged);
    on<StartDateChanged>(_onStartDateChanged);
    on<EndDateChanged>(_onEndDateChanged);
    on<PopulateEmployee>(_onPopulateEmployee);
  }

  _onPopulateEmployee(PopulateEmployee event, Emitter<EmployeeState> emit) {
    final state = this.state;
    emit(EmployeeState(employee: event.employee));
  }

  _onNameChanged(NameChanged event, Emitter<EmployeeState> emit) {
    final state = this.state;
    emit(EmployeeState(employee: state.employee.copyWith(name: event.name)));
  }

  _onRoleChanged(RoleChanged event, Emitter<EmployeeState> emit) {
    final state = this.state;
    emit(EmployeeState(employee: state.employee.copyWith(role: event.role)));
  }

  _onStartDateChanged(StartDateChanged event, Emitter<EmployeeState> emit) {
    final state = this.state;
    emit(EmployeeState(
        employee: state.employee.copyWith(startDate: event.startDate)));
  }

  _onEndDateChanged(EndDateChanged event, Emitter<EmployeeState> emit) {
    final state = this.state;
    emit(EmployeeState(
        employee: state.employee.copyWith(endDate: event.endDate)));
  }

  _onAddEmployee(AddEmployee event, Emitter<EmployeeState> emit) {
    final state = this.state;
    Employee emp = event.employee;
    if (emp.endDate == "No date" || emp.endDate == "") {
      emp = emp.copyWith(id: DateTime.now().toIso8601String(), endDate: "");
    } else {
      emp = emp.copyWith(id: DateTime.now().toIso8601String());
    }
    allEmployee = List.from(allEmployee)..add(emp);
    emit(EmployeeState(allEmployee: allEmployee, employee: const Employee()));
  }

  _onUpdateEmployee(UpdateEmployee event, Emitter<EmployeeState> emit) {
    final state = this.state;
    Employee employee = event.employee;
    int index = allEmployee.indexWhere((element) => element.id == employee.id);
    List<Employee> list = allEmployee..removeAt(index);
    // if (list.isNotEmpty) {
    list.insert(index, employee);
    // } else {
    //   list.add(employee);
    // }
    allEmployee = list;
    emit(EmployeeState(allEmployee: list));
  }

  _onDeleteEmployee(DeleteEmployee event, Emitter<EmployeeState> emit) {
    final state = this.state;

    allEmployee = List.from(allEmployee)..remove(event.employee);
    emit(EmployeeState(allEmployee: allEmployee));
  }

  @override
  EmployeeState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return EmployeeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(EmployeeState state) {
    // TODO: implement toJson
    return state.toMap();
  }
}
