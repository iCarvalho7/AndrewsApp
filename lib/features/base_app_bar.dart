import 'package:andrews_app/data/utils/app_assets.dart';
import 'package:andrews_app/data/utils/app_spacements.dart';
import 'package:andrews_app/data/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: menuColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: const [
          DarkModeButton(),
        ],
      ),
      drawer: Container(
        color: context.theme.backgroundColor,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Numbers.twenty,
                  horizontal: Numbers.teen,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppAssets.andrewsFaceIcon,
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Andrews App',
                                style: AppStyles.titleStyle,
                              ),
                              Text(
                                'Versão: 0.0.1',
                                style: AppStyles.subTitleStyle,
                              ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.close),
                            color: menuColor,
                            onPressed: () => Scaffold.of(context).openEndDrawer(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Numbers.eight,
                    ),
                    const SearchWidget()
                  ],
                ),
              ),
              const DrawerItem(
                title: 'Bíblia',
                icon: MdiIcons.book,
              ),
              const DrawerItem(
                title: 'Textos Marcados',
                icon: MdiIcons.pencil,
              ),
              const DrawerItem(
                title: 'Pesquisa por Voz',
                icon: MdiIcons.textToSpeech,
              ),
            ],
          ),
        ),
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

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Numbers.teen),
      child: Material(
        color: Colors.transparent,
        elevation: Numbers.twenty,
        child: Container(
          padding: const EdgeInsets.all(Numbers.teen),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(Numbers.twenty),
              topLeft: Radius.circular(Numbers.twenty),
              bottomRight: Radius.circular(Numbers.twenty),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: Numbers.forty,
                color: context.iconColor,
              ),
              Expanded(
                child: Text(
                  title,
                  style:
                      AppStyles.titleStyle.copyWith(fontSize: Numbers.twenty),
                  maxLines: Numbers.two.toInt(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const Icon(Icons.chevron_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.transparent,
      child: TextField(
        cursorColor: context.iconColor,
        decoration: InputDecoration(
          border: const OutlineInputBorder().copyWith(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(Numbers.twenty),
            ),
          ),
          fillColor: context.theme.cardColor,
          filled: true,
          hintText: 'Pesquisar',
          hintStyle: context.textTheme.bodyLarge,
          prefixIcon: Icon(
            Icons.search,
            color: context.iconColor,
          ),
        ),
      ),
    );
  }
}
