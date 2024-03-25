import 'package:flutter/material.dart';

class PageAnimationRoutes extends PageRouteBuilder {

  final Widget next;

  PageAnimationRoutes({required this.next}) : super(

    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (

      BuildContext context,
      Animation<double> mainAnimation,
      Animation<double> secondaryAnimation,
      Widget child

    ) {

      mainAnimation = CurvedAnimation(parent: mainAnimation, curve: Curves.easeInOutBack);
      return ScaleTransition(
        
        alignment: const Alignment(0.8, 0.8),
        scale: mainAnimation, 
        child: child
        
      );

    },

    pageBuilder: (
    
      BuildContext context,
      Animation<double> mainAnimation,
      Animation<double> secondaryAnimation 
    
    ) {

      return next;

    }

  );

}

