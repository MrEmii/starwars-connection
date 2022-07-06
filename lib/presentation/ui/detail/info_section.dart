import 'package:flutter/material.dart';

class InfoSectionDetail extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoSectionDetail({Key? key, required this.children, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: theme.headline6?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: children,
          ),
        )
      ],
    );
  }
}
