import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import '../lists/pagelist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;
    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }
    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }
    return Scaffold(
        body: PagesList().pages[currentPage],
        bottomNavigationBar: CircleBottomNavigationBar(
          initialSelection: currentPage,
          barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
          arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
          itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
          itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
          circleOutline: 15.0,
          shadowAllowance: 0.0,
          circleSize: 50.0,
          blurShadowRadius: 50.0,
          circleColor: Colors.purple,
          activeIconColor: Colors.white,
          inactiveIconColor: Colors.grey,
          tabs: [
            TabData(
              icon: Icons.home,
              iconSize: 25.0,
              title: 'Home',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            TabData(
              icon: Icons.shopping_cart,
              iconSize: 25,
              title: 'Cart',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            TabData(
              icon: Icons.search,
              iconSize: 25,
              title: 'Search',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),

            TabData(
              icon: Icons.account_circle,
              iconSize: 25,
              title: 'Account',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )
          ],
          onTabChangedListener: (index) => setState(() => currentPage = index),
        ));
  }
}
