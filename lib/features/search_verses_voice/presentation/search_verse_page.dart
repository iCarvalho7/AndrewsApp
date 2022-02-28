import 'package:andrews_app/features/dark_mode/dark_mode_widget.dart';
import 'package:andrews_app/features/search_verses_voice/presentation/search_verses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchVersePage extends GetView<MainController> {
  const SearchVersePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa por Voz'),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: const [
          DarkModeButton(),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: context.theme.backgroundColor,
        child: Column(

        ),
      ),
    );
  }
}
