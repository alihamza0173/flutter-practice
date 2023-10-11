import 'package:flutter/material.dart';
import 'package:portfolio/presentation/common/widgt/responsive_layout_screen.dart';
import 'package:portfolio/presentation/screens/home/desktop_screen.dart';
import 'package:portfolio/presentation/screens/home/mobile_screen.dart';
import 'package:portfolio/presentation/screens/home/tablet_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileScreen(),
      tablet: TabletScreen(),
      desktop: DesktopScreen(),
    );
  }
}
