import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  const Bounce({required this.child, required this.animate, Key? key})
      : super(key: key);

  final Widget child;
  final bool animate;

  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.30), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.30, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Bounce oldWidget) {
    if (widget.animate) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        if (mounted) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
