import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final usernameCubit = context.watch<UsernameCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: BlocBuilder<UsernameCubit, String>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          print('Cambio de estado');
          return Center(
            child: Text(state),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //usernameCubit.setUsername(RandomGenerator.getRandomName());
            context.read<UsernameCubit>().setUsername(
                  //'Andres Vasquez'
                  RandomGenerator.getRandomName(),
                );
          },
          child: const Icon(Icons.refresh)),
    );
  }
}
