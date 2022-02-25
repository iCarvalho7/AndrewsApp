import 'package:andrews_app/data/utils/colors.dart';
import 'package:andrews_app/features/search_verses_voice/presentation/search_verses_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchVersePage extends GetView<MainController> {

   const SearchVersePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundLightMode,
      appBar: AppBar(
        title: Text('Pesquisa por Voz'),
      ),
      body: SafeArea(
        child: Column(

        ),
      ),
    );
  }
}
