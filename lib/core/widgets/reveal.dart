import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
  );
  late final Animation<double> _opacity = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );
  late final Animation<Offset> _offset = Tween(
    begin: const Offset(0, 0.04),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _run());
  }

  Future<void> _run() async {
    if (!mounted) return;
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
      return;
    }
    if (widget.delay > Duration.zero) {
      await Future<void>.delayed(widget.delay);
    }
    if (mounted) _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child),
    );
  }
}

class HoverLift extends StatefulWidget {
  const HoverLift({super.key, required this.child});

  final Widget child;

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedTranslate(
        offset: !reduce && _hover ? const Offset(0, -4) : Offset.zero,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

class AnimatedTranslate extends StatelessWidget {
  const AnimatedTranslate({
    super.key,
    required this.offset,
    required this.duration,
    required this.curve,
    required this.child,
  });

  final Offset offset;
  final Duration duration;
  final Curve curve;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(end: offset),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }
}

class CenteredBody extends StatelessWidget {
  const CenteredBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSpacing.maxContent),
        child: child,
      ),
    );
  }
}
