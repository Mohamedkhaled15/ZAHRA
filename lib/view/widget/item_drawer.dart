import 'package:flutter/material.dart';

import 'button_logout.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(

      children:   const [
        
       ButtonLogoutItem(),
      ],
    );
  }
}
