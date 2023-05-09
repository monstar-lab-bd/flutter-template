import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/presentation/resources/resources.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  void _onItemTap(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        return AppBar(
          title: const Text('Flutter Template'),
        );
      },
      routes: const [
        HomeRoute(),
        NewsRoute(),
        ProfileRoute(),
      ],
      backgroundColor: context.colors.background,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: context.colors.background,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) => _onItemTap(index, tabsRouter),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
