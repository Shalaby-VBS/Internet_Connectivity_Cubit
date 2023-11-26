import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_check_cubit/logic/cubit/internet_connection_cubit.dart';

import 'logic/cubit/internet_connection_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
          builder: (context, state) {
            return Text(
              state is InternetConnectedState
                  ? state.internetState
                  : state is InternetNotConnectedState
                      ? state.internetState
                      : 'No Internet Check!',
            );
          },
        ),
      ),
    );
  }
}
