import 'package:flutter/material.dart';
import 'package:starwars_connection/presentation/theme.dart';

class InfoTextDetail extends StatelessWidget {
  final String leadInfo;
  final String info;
  final IconData icon;

  const InfoTextDetail({Key? key, required this.leadInfo, required this.info, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primaryColor),
        const SizedBox(width: 10),
        Text(
          leadInfo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(info),
      ],
    );
  }
}
