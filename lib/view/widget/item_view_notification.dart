import 'package:flutter/material.dart';

import '../../controller/notification_controller.dart';
import 'item_notification.dart';


class ItemViewNotification extends StatefulWidget {

  @override
  State<ItemViewNotification> createState() => _ItemViewNotificationState();
}


class _ItemViewNotificationState extends State<ItemViewNotification> {
  late NotificationController  controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(


      flex: 5,
      child: ListView.builder(

        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) => ItemNotification(controller,index),
      ),
    );
  }
}
