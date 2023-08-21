import 'package:flutter/material.dart';

class LogoAppEx5 extends StatefulWidget {
  const LogoAppEx5({super.key});

  @override
  State<LogoAppEx5> createState() => _LogoAppState();
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class _LogoAppState extends State<LogoAppEx5>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // ..addStatusListener((status) {
    //   // animation loop logo to zoomin and zoom out
    //   // if (status == AnimationStatus.completed) {
    //   //   controller.reverse();
    //   // } else if (status == AnimationStatus.dismissed) {
    //   //   controller.forward();
    //   // }
    // })
    // ..addStatusListener((status) {
    //   print('$status');
    // });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);
  // @override
  // Widget build(BuildContext context) {
  //   print(animation.value);
  //   return Center(
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 10),
  //       height: animation.value,
  //       width: animation.value,
  //       child: const FlutterLogo(),
  //     ),
  //   );
  // }
}
