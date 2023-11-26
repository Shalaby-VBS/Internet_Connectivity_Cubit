import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_check_cubit/logic/cubit/internet_connection_cubit.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Check Cubit',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => InternetConnectionCubit()..checkConnectivity(),
        child: const HomeScreen(),
      ),
    );
  }
}
