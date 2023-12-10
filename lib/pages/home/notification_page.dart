import 'package:coffee_shop/theme.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming soon!!!',
        style: subtitleTextStyle,
      ),
    );
  }
}
