import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/menu_provider.dart';
import 'package:starwars_connection/presentation/ui/loading_modal.dart';
import 'package:starwars_connection/presentation/ui/menu/option.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    context.read<MenuProvider>().fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<MenuProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu de opciones"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          MenuOption(
            option: "activar/desactivar la “conexión”",
            status: context.watch<MenuProvider>().user?.hasConnection ?? false,
            onChange: (value) {
              LoadingModal.show(context, () async {
                await context.read<MenuProvider>().switchOption(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
