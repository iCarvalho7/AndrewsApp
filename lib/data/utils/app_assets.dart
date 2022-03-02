import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

mixin AppAssets {
  static final SvgPicture andrewsFaceIcon = SvgPicture.asset('assets/images/andrews_face_icon.svg');


  static final SvgPicture bookAndPencilIconDark = SvgPicture.asset('assets/images/book_pencil_dark.svg');
  static final SvgPicture bookAndPencilIconLight = SvgPicture.asset('assets/images/book_and_pencil_light.svg');

  static final SvgPicture hollyBibleIconDark = SvgPicture.asset('assets/images/holly_bible_dark.svg');
  static final SvgPicture hollyBibleIconLight = SvgPicture.asset('assets/images/holy_bible_light.svg');

  static final SvgPicture speechToTextIconDark = SvgPicture.asset('assets/images/speech_to_text_dark.svg');
  static final SvgPicture speechToTextIconLight = SvgPicture.asset('assets/images/speech_to_text_light.svg');
}