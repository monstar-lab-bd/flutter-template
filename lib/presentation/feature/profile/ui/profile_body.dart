import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter_template/presentation/feature/profile/cubit/profile_state.dart';
import 'package:flutter_template/presentation/resources/resources.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            debugPrint(state.toString());
            return state.status.maybeWhen(
              loading: () => const CircularProgressIndicator(),
              success: () => Text('Hi ${state.name}'),
              failure: (error) => const Text('Something went Wrong!'),
              orElse: () {
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
