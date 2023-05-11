import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/common/base_status/base_status.dart';
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
            if (state.status.isSuccess) {
              return Text('Hi ${state.name}');
            } else if (state.status.isFailure) {
              return const Text('Something went wrong!');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
