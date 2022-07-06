import 'package:flutter/material.dart';

class TheForceBeWithYou extends StatefulWidget {
  const TheForceBeWithYou({Key? key}) : super(key: key);

  @override
  State<TheForceBeWithYou> createState() => _TheForceBeWithYouState();
}

class _TheForceBeWithYouState extends State<TheForceBeWithYou> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Opacity(
            opacity: _animation.value,
            child: const Text("Que la fuerza te acompañe", softWrap: true, textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          );
        },
      ),
    );
  }
}
