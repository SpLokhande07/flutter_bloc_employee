

import 'package:employee_ri/model/employee.dart';
import 'package:equatable/equatable.dart';
import 'package:employee_ri/controller/bloc_exports.dart';
part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
      on<AddEmployee>(_onAddEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);
    on<EmployeeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  _onAddEmployee(AddEmployee event, Emitter<EmployeeState> emit){
      final state = this.state;
      emit(EmployeeState(allEmployee: List.from(state.allEmployee)..add(event.employee)));


  }
  _onUpdateEmployee(UpdateEmployee event, Emitter<EmployeeState> emit){

      final state = this.state;
      Employee employee = event.employee;
      int index = List.from(state.allEmployee).indexOf(employee);
      List<Employee> list = List.from(state.allEmployee)..remove(employee);
      list.insert(index,employee);
      emit(EmployeeState(allEmployee: list));
  }
  _onDeleteEmployee(DeleteEmployee event, Emitter<EmployeeState> emit){
      final state = this.state;
      emit(EmployeeState(allEmployee: List.from(state.allEmployee)..remove(event.employee)));
  }

}
