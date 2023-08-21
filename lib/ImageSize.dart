import 'package:flutter/material.dart';

class ImageSize extends StatelessWidget {
  const ImageSize({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // Change to buildFoo() for the other examples
        body: Center(child: buildExpandedImages()),
      ),
    );
  }

  Widget buildOverflowingRow() =>
      // #docregion overflowing-row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/pic1.jpg'),
          Image.asset('images/pic2.jpg'),
          Image.asset('images/pic3.jpg'),
        ],
      );
  // #enddocregion overflowing-row

  Widget buildExpandedImages() =>
      // #docregion expanded-images
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset('images/pic1.jpg'),
          ),
          Expanded(
            child: Image.asset('images/pic2.jpg'),
          ),
          Expanded(
            child: Image.asset('images/pic3.jpg'),
          ),
        ],
      );
  // #enddocregion expanded-images

  Widget buildExpandedImagesWithFlex() =>
      // #docregion expanded-images-with-flex
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: const Alignment(0, 0.5),
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/pic1.jpg'),
                  radius: 100,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: const Text(
                    'nam dao',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset('images/pic2.jpg'),
          ),
          Expanded(
            child: Image.asset('images/pic3.jpg'),
          ),
        ],
      );
  // #enddocregion expanded-images-with-flex
}
