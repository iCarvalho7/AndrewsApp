import 'package:andrews_app/data/utils/app_assets.dart';
import 'package:andrews_app/data/utils/app_spacements.dart';
import 'package:andrews_app/features/messages/domain/entities/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/utils/app_styles.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: message.isQuestion
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: !message.isQuestion,
          child: Flexible(
            flex: Numbers.one.toInt(),
            child: AppAssets.andrewsFaceIcon,
          ),
        ),
        Flexible(
          flex: Numbers.five.toInt(),
          fit: FlexFit.tight,
          child: MessageCardWidget(
            message: message,
          ),
        ),
        Visibility(
          visible: message.isQuestion,
          child: Flexible(
            flex: Numbers.one.toInt(),
            child: AppAssets.andrewsFaceIcon,
          ),
        ),
      ],
    );
  }
}

class MessageCardWidget extends StatelessWidget {
  final Message message;

  const MessageCardWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.screenPartHeight(Numbers.forty)),
      padding: const EdgeInsets.symmetric(vertical: Numbers.fifteen),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Material(
            elevation: Numbers.five,
            borderRadius: _fetchBorder(),
            color: context.theme.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(Numbers.fifteen),
              child: Column(
                crossAxisAlignment: message.isQuestion
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !message.isQuestion,
                    child: Text(
                      message.title,
                      style: AppStyles.titleStyle,
                    ),
                  ),
                  !message.isQuestion ? Column(
                    children: message.formattedVerses
                  ) : Text(message.description)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius _fetchBorder() {
    if (!message.isQuestion) {
      return const BorderRadius.only(
        topRight: Radius.circular(Numbers.twenty),
        bottomLeft: Radius.circular(Numbers.twenty),
        bottomRight: Radius.circular(Numbers.twenty),
      );
    } else {
      return const BorderRadius.only(
        topRight: Radius.circular(Numbers.teen),
        topLeft: Radius.circular(Numbers.teen),
        bottomLeft: Radius.circular(Numbers.teen),
      );
    }
  }
}
