import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/core/helpers/routes/route_generator.dart';
import 'package:wtf_gym_assignment/core/helpers/routes/route_helper.dart';
import 'package:wtf_gym_assignment/cubit/gym_location_cubit.dart';
import 'package:wtf_gym_assignment/ui/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GymLocationCubit()..requestLocationPermission(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: RouteHelper.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
