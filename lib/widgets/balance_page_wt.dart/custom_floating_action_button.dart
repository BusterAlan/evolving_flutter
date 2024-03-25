import 'package:evolving_flutter/pages/add_entries.dart';
import 'package:evolving_flutter/pages/add_expenses.dart';
import 'package:evolving_flutter/utils/page_animation_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFAB extends StatelessWidget {

  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {

    List<SpeedDialChild> childButtons = [];

    childButtons.add(
      
      SpeedDialChild(

        backgroundColor: Colors.red,
        child: const Icon(Icons.remove),
        label: 'Gasto',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {

          Navigator.push(context, PageAnimationRoutes(next: const AddExpenses())
            
          );

        }

      )
      
    );

    childButtons.add(
      
      SpeedDialChild(

        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        label: 'Ingreso',
        labelStyle: const TextStyle(fontSize: 18),
        onTap: () {

          Navigator.push(context, PageAnimationRoutes(next: const AddEntries()));

        }

      )
      
    );

    return SpeedDial(

      icon: Icons.add,
      activeIcon: Icons.close,
      children: childButtons,
      spacing: 10,
      childMargin: const EdgeInsets.symmetric(horizontal: 10),
      childrenButtonSize: const Size(60, 60),

    );

  }

}

