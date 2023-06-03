import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.title,
    required this.body,
  }) : color = Colors.green;

  const NotificationWidget.error({
    super.key,
    required this.title,
    required this.body,
  }) : color = Colors.red;

  final String title;
  final String body;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Column(
        children: [
          Text(title),
          Text(body),
        ],
      ),
    );
  }
}
