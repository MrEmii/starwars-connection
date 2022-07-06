import 'package:flutter/material.dart';
class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: textTheme.headline6?.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
