import 'package:flutter/material.dart';

class LogoAppEx1 extends StatefulWidget {
  const LogoAppEx1({super.key});

  @override
  State<LogoAppEx1> createState() => _LogoAppState();
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    print(animation.value);
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}

class _LogoAppState extends State<LogoAppEx1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
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
