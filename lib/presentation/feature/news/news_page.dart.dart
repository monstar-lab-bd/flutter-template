import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('News Screen'),
      ),
    );
  }
}
