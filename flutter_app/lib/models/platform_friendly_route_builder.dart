import 'package:flutter/material.dart';
import 'dart:io';

class PlatformFriendlyRouteBuilder extends PageRouteBuilder {
  final RoutePageBuilder routePageBuilder;
  final PageTransitionsBuilder iosTransitionsBuilder =
      const CupertinoPageTransitionsBuilder();
  final PageTransitionsBuilder otherPlatformTransitionsBuilder =
      const FadeUpwardsPageTransitionsBuilder();

  PlatformFriendlyRouteBuilder({required this.routePageBuilder})
      : super(pageBuilder: routePageBuilder);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return routePageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (Platform.isIOS) {
      return iosTransitionsBuilder.buildTransitions(
          this, context, animation, secondaryAnimation, child);
    }
    return otherPlatformTransitionsBuilder.buildTransitions(
        this, context, animation, secondaryAnimation, child);
  }
}
