import 'package:andrews_app/data/utils/app_spacements.dart';
import 'package:andrews_app/features/base_app_bar.dart';
import 'package:andrews_app/features/search_verses_voice/presentation/search_verses_controller.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/utils/app_styles.dart';
import '../../messages/presentation/widgets/message_widget.dart';

class SearchVersePage extends GetView<MainController> {
  const SearchVersePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAppStructure(
      title: 'Pesquisa por Voz',
      menuColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx( () => Expanded(
              child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.messageList.length,
                  padding: const EdgeInsets.all(Numbers.teen),
                  itemBuilder: (context, index) {
                    return MessageWidget(
                      message: controller.messageList[index],
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: Numbers.four.toInt(),
                  fit: FlexFit.tight,
                  child: Material(
                    color: Colors.transparent,
                    elevation: Numbers.twenty,
                    child: Container(
                      height: context.screenPartHeight(12),
                      decoration: AppStyles.roundedBox
                          .copyWith(color: context.theme.cardColor),
                      child: Obx(
                        () => Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              controller.query.value,
                              textAlign: TextAlign.center,
                              style:
                                  AppStyles.subTitleStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Numbers.eight),
                GestureDetector(
                  onTapDown: (_) => controller.startRecordingAudio(),
                  onTapUp: (_) => controller.stopRecordingAudio(),
                  child: Material(
                    color: Colors.transparent,
                    elevation: Numbers.twenty,
                    child: Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        width: controller.buttonWidth.value,
                        height: controller.buttonHeight.value,
                        decoration: AppStyles.roundedBox.copyWith(
                            color: context.theme.secondaryHeaderColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: AvatarGlow(
                          endRadius: 30,
                          animate: controller.isRecordingAudio.value,
                          child: const Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
