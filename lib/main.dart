import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:my_app/animation/example5.dart';
import 'ImageSize.dart';
import 'stateBasic.dart';
import 'ListView.dart';
import 'SliverList.dart';
import 'ListScrollParallax.dart';
import 'DrawerMenu.dart';
import 'TabbarApp.dart';
import 'DragInteracty.dart';
import 'SwipeToDismiss.dart';
import 'Navigator.dart';
import './animation/example1.dart';
import './animation/example4.dart';
import './animation/randomBox.dart';
import './animation/heroanimation.dart';
import './animation/heroRadialAnimation.dart';

void main() {
  debugPaintSizeEnabled = false; // Remove to suppress visual layout

  /* stateBasic.dart */
  // runApp(const MaterialApp(
  //     title: 'Shopping list',
  //     home: ShoppingList(lsProducts: [
  //       Product(name: 'Chair'),
  //       Product(name: 'Flour'),
  //       Product(name: 'Chocolate chips'),
  //     ])));

  /* ImageSize.dart */
  // runApp(const ImageSize());

  /* ListView.dart */
  // runApp(const HorizontalList());

  /* SliverList.dart */
  // runApp(const SliverListApp());

  /* ListScrollParallax.dart */
  // runApp(const ListScrollParallax());

  /* DrawerMenu.dart */
  // runApp(const DrawerMenu());

  /* TabbarApp.dart */
  // runApp(const TabBarApp());

  /* DragInteracty.dart */
  // runApp(const MaterialApp(
  //   home: ExampleDragAndDrop(),
  //   debugShowCheckedModeBanner: false,
  // ));
  /* SwipeToDismiss.dart */
  // runApp(const SwipeToDismiss());
  /* Navigator basic */
  // runApp(const MaterialApp(
  //   title: 'Navigation Basics',
  //   home: NavigatorApp(),
  // ));
  /* Animation */
  // runApp(const LogoAppEx1());
  // runApp(const LogoAppEx4());
  // runApp(const LogoAppEx5());
  // runApp(const RandomBox());

  // timeDilation = 1.0;
  // runApp(const MaterialApp(
  //   title: 'Navigation Basics',
  //   home: HeroAnimation(),
  // ));
  runApp(const MaterialApp(
    home: RadialExpansionDemo(),
  ));
}
