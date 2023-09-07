import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/injection/injector.dart';
import 'package:flutter_template/presentation/feature/quote/cubit/quote_cubit.dart';
import 'package:flutter_template/presentation/feature/quote/ui/quote_body.dart';

@RoutePage()
class QuotePage extends StatelessWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuoteCubit>(
      create: (context) => injector(),
      child: const QuoteBody(),
    );
  }
}
