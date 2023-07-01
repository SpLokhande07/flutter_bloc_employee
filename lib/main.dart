import 'package:employee_ri/controller/bloc/employee_bloc.dart';
import 'package:employee_ri/utils/bloc_observre.dart';
import 'package:employee_ri/views/home_screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'controller/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await path.getApplicationDocumentsDirectory());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1DA1F2)),
          useMaterial3: false,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
