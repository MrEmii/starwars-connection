import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/persistent/hive_db.dart';
import 'package:starwars_connection/application/provider/detail_provider.dart';
import 'package:starwars_connection/presentation/ui/loading_modal.dart';

class ReportButton extends StatefulWidget {
  const ReportButton({Key? key}) : super(key: key);

  @override
  State<ReportButton> createState() => _ReportButtonState();
}

class _ReportButtonState extends State<ReportButton> {
  bool enabled = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      enabled = (await HiveDB.db.user).hasConnection;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: GestureDetector(
        onTap: enabled
            ? () => LoadingModal.show(context, () async {
                  await context.read<DetailProvider>().report();
                })
            : null,
        child: SizedBox(
          width: size.width * .8,
          height: 50,
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(-5, 0),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(color: Colors.yellowAccent, width: 4)),
                    color: Colors.black,
                  ),
                  transform: Matrix4.skewX(.3),
                ),
              ),
              Center(
                child: Text("REPORTAR", style: theme.button?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
