import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2), lowerBound: .5);
  late final Animation<double> _animation = CurvedAnimation(curve: Curves.easeInOutCirc, parent: _controller);

  @override
  void initState() {
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 + _animation.value,
            child: child,
          );
        },
        child: Image(
          image: const ResizeImage(AssetImage("assets/images/starwars.png"), width: 324, height: 138),
          width: size.width * .3,
        ),
      ),
    );
  }
}
