import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injections.dart';
import 'core/local_storage.dart';
import 'features/authentication/auth_bloc/auth_bloc.dart';
import 'features/authentication/ui/login_screen.dart';
import 'features/todos/todos_bloc/todos_bloc.dart';
import 'network/repositories/todo_repository/api_imp.dart';


void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthBloc(getIt<Repository>(), getIt<LocalStorage>()),
            ),
            BlocProvider(
              create: (_) => TodosBloc(getIt<Repository>()),
            ),
          ],
          child: MaterialApp(
            title: 'Task Manager App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
