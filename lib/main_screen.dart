import 'package:flutter/material.dart';
import 'package:task_desktop/controllers/MenuAppController.dart';
import 'package:task_desktop/home_Screen.dart';
import 'package:task_desktop/responsive.dart';
import 'package:task_desktop/widget/side_menu.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: HomeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
