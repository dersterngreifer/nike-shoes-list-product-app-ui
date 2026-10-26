import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nike_shoes_list_product_app/components/bottomnav/bottomnav.dart';
import 'package:nike_shoes_list_product_app/screens/dashboard_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: const DashboardScreen(),
          bottomNavigationBar: bottomNav(context),
        ),
      ),
    );
  }
}
