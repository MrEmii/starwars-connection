import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

class LoadingModal extends StatefulWidget {
  final Future<void> Function() future;
  const LoadingModal({Key? key, required this.future}) : super(key: key);

  static Future<void> show(BuildContext context, future) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingModal(
          future: future,
        );
      },
    );
  }

  @override
  State<LoadingModal> createState() => _LoadingModalState();
}

class _LoadingModalState extends State<LoadingModal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  late CancelableOperation cancellableOperation;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _controller.forward();
      await (cancellableOperation = CancelableOperation.fromFuture(
        widget.future(),
        onCancel: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ))
          .valueOrCancellation();
      await _controller.reverse();
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        await cancellableOperation.cancel();
        return true;
      },
      child: SizedBox.fromSize(
        size: size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                opacity: _controller.value.clamp(0.0, 1.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutExpo,
                        top: (size.height / 3) * (_controller.value),
                        child: const Center(
                          child: Image(
                            image: AssetImage('assets/images/starwars.png'),
                            height: 100,
                          ),
                        )),
                    AnimatedPositioned(duration: const Duration(milliseconds: 300), curve: Curves.easeInOutExpo, bottom: (size.height / 3) * (_controller.value), child: const Center(child: CircularProgressIndicator())),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
