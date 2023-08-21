import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {super.key,
      required this.photo,
      required this.width,
      required this.onTap});
  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}

class HeroDetailAnimation extends StatelessWidget {
  const HeroDetailAnimation({super.key, required this.photo});

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flippers Page'),
      ),
      body: Container(
        // The blue background emphasizes that it's a new route.
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topLeft,
        child: Center(
            child: PhotoHero(
          photo: photo,
          width: 300,
          onTap: () {
            Navigator.of(context).pop();
          },
        )),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});
  static const photoUrl =
      'https://docs.flutter.dev/cookbook/img-files/effects/parallax/02-singapore.jpg';
  static const photoUrl2 =
      'https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Hero Animation'),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: PhotoHero(
            photo: photoUrl2,
            width: 100.0,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HeroDetailAnimation(
                            photo: photoUrl2,
                          )));
            },
          ),
        ));
  }
}
