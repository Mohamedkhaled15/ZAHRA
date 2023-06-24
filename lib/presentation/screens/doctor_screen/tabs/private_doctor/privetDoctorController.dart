import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/styles_manger.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';

class PrivateDoctorController {
  Map<String, List<dynamic>> doctorChat = {
    'senderImage': [
      ClipOval(
        child: Image(
          image: AssetImage(ImageAssets.me),
        ),
      ),
      ClipOval(
        child: Image(
          image: AssetImage(ImageAssets.me),
        ),
      ),
      ClipOval(
        child: Image(
          image: AssetImage(ImageAssets.me),
        ),
      ),
      ClipOval(
        child: Image(
          image: AssetImage(ImageAssets.me),
        ),
      ),
    ],
    'senderEmail': [],
  };
  List<Widget> images = [
    ClipOval(
      child: Image(
        image: AssetImage(ImageAssets.me),
      ),
    ),
    ClipOval(
      child: Image(
        image: AssetImage(ImageAssets.doca),
      ),
    ),
    ClipOval(
      child: Image(
        image: AssetImage(ImageAssets.docw2),
      ),
    ),
    ClipOval(
      child: Image(
        image: AssetImage(ImageAssets.docctor3),
      ),
    ),
    ClipOval(
      clipBehavior: Clip.antiAlias,
      child: Image(
        image: AssetImage(ImageAssets.doctorah),
      ),
    ),
  ];


}
