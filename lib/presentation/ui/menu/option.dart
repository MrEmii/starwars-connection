import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String option;
  final bool status;
  final Function(bool) onChange;

  const MenuOption({super.key, required this.option, required this.status, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(option, style: textTheme.labelLarge),
        Switch(
          value: status,
          onChanged: onChange,
          activeColor: Colors.green[400],
        ),
      ],
    );
  }
}
