import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'employee_bloc_event.dart';
part 'employee_bloc_state.dart';

class EmployeeBlocBloc extends Bloc<EmployeeBlocEvent, EmployeeBlocState> {
  EmployeeBlocBloc() : super(EmployeeBlocInitial()) {
    on<EmployeeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
