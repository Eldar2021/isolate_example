import 'package:flutter/material.dart';

//typedef _TPSM = TickerProviderStateMixin;

class SmoothAnimation extends StatefulWidget {
  const SmoothAnimation({super.key});

  @override
  State<SmoothAnimation> createState() => _SmoothAnimationState();
}

class _SmoothAnimationState extends State<SmoothAnimation> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<BorderRadius?> _borderAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(_animationController);

    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _borderAnimation,
        builder: (context, child) {
          return Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Colors.blueAccent,
                  Colors.redAccent,
                ],
              ),
              borderRadius: _borderAnimation.value,
            ),
            child: const FlutterLogo(
              size: 200,
            ),
          );
        },
      ),
    );
  }
}
