import 'package:evolving_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class BackSheet extends StatelessWidget {

  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {

    headers(String name, String amount, Color colorText) {

      return Column(

        children: [

          Padding(
            
            padding: const EdgeInsets.only(top: 13, bottom: 5),
            child: Text(
              
              name,
              style: const TextStyle(

                fontSize: 18,
                letterSpacing: 1.5,

              ),
              
            ),
            
          ),

          Text(
            
            amount,
            style: TextStyle(

              fontSize: 20,
              letterSpacing: 1.5,
              color: colorText

            ),
            
          ),

        ],

      );

    }

    return Container(

      height: 250,
      decoration: Constants.sheetBoxDecoration(context, null),
      child: Row(
      
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      
          headers('Ingresos', '\$3,500.00', Colors.green),
      
            const VerticalDivider(
            
            thickness: 2,
            
          ),
      
          headers('Gastos', '\$1,500.00', Colors.red),
      
        ],
      
      ),

    );

  }

}

