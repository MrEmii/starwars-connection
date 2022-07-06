import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/starwars.png", height: 30, cacheWidth: 183, cacheHeight: 78),
          IconButton(
            onPressed: () => context.push("/menu"),
            icon: const Icon(Icons.settings),
            splashRadius: 15,
          ),
        ],
      ),
    );
  }
}
