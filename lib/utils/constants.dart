import 'package:flutter/material.dart';

class Constants {

  static sheetBoxDecoration(BuildContext context, Color? color) {

    return BoxDecoration(

      color: color ?? Theme.of(context).primaryColorDark,
      borderRadius: const BorderRadius.only(
        
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30)
        
      )

    );

  }

  static customButton(Color deco, Color borderColor, String txt) {

    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Container(
      
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
      
          color: deco,
          border: Border.all(
            
            color: borderColor
            
          ),
          
          borderRadius: const BorderRadius.all(Radius.circular(25)),
      
        ),
      
        child: Center(
          
          child: Text(txt)
          
        ),
      
      ),
      
    );

  }

}

