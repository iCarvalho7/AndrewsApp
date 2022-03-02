import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dark_mode/dark_mode_widget.dart';

class BaseAppStructure extends StatelessWidget {
  final String title;
  final Color menuColor;
  final Widget body;

  const BaseAppStructure(
      {Key? key,
      required this.title,
      required this.menuColor,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Icon(
          Icons.menu,
          color: menuColor,
        ),
        actions: const [
          DarkModeButton(),
        ],
      ),
      body: Container(
        color: context.theme.backgroundColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
