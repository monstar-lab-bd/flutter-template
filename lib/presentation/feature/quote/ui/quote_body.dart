import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/common/base_status/base_status.dart';
import 'package:flutter_template/presentation/feature/quote/cubit/quote_cubit.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/widgets/app_button/app_button.dart';

class QuoteBody extends StatelessWidget {
  const QuoteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quote =
        context.select((QuoteCubit cubit) => cubit.state.quoteEntity?.body);

    final isLoading =
        context.select((QuoteCubit cubit) => cubit.state.status.isLoading);

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hi, Ashraful Haque!'),
            const SizedBox(height: 30),
            const Text('Quote: '),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: Text(
                quote ?? 'Not Available',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: AppButton.primary(
                onPressed: () {
                  context.read<QuoteCubit>().getQuote();
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
