import 'package:activity/di/drilling_activity_injection.dart';
import 'package:drilling_app/core/navigation/navigation_cubit.dart';
import 'package:drilling_app/di/main_injection.dart';
import 'package:drilling_app/features/drilling/bloc/drilling_bloc.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase.dart';
import 'package:drilling_app/features/drilling/usecase/input_drilling_usecase_impl.dart';
import 'package:drilling_app/routing/navigation_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await mainInjection(); 
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
        BlocProvider<DrillingBloc>(create: (context) => DrillingBloc(drilling:getIt<InputDrilling>() )),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true, // penting kalau web
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: widget,
              ),
            );
          },
        );
      },
    );
  }
}
