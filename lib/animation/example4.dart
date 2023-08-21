import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition(
      {super.key, required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, childAnonymus) {
          print('remder');
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: childAnonymus,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoAppEx4 extends StatefulWidget {
  const LogoAppEx4({super.key});

  @override
  State<LogoAppEx4> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoAppEx4>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(animation: animation, child: const LogoWidget());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
