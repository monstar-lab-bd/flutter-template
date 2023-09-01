import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/common/base_status/base_status.dart';
import 'package:flutter_template/presentation/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter_template/presentation/feature/profile/cubit/profile_state.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/widgets/app_button/app_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quote =
        context.select((ProfileCubit cubit) => cubit.state.quoteEntity?.body);

    final isLoading =
        context.select((ProfileCubit cubit) => cubit.state.status.isLoading);

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.status.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  success: () => Text('Hi ${state.name}'),
                  failure: (error) => const Text('Something went Wrong!'),
                  orElse: () => const SizedBox(),
                );
              },
            ),
            const SizedBox(height: 30),
            Text(quote ?? 'Not Available'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: AppButton.primary(
                onPressed: () {
                  context.read<ProfileCubit>().getQuote();
                },
                isLoading: isLoading,
                child: const Text('Get Quote!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
