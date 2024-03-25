import 'package:evolving_flutter/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {

  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    // Cuando "Provider.of<UIProvider>(context, listen: true), por defecto"

    final watchIndex = context.watch<UIProvider>();

    // Cuando "Provider.of<UIProvider>(context, listen: false), no va a estar escuchando"

    final read = context.read<UIProvider>();

    return BottomNavigationBar(
      
      currentIndex: watchIndex.bnbIndex,
      onTap: (int i) => read.bnbIndex = i,
      elevation: 0,
      items: const [

        BottomNavigationBarItem(
          
          icon: Icon(Icons.account_balance_outlined), 
          label: 'Balance'
          
        ),

        BottomNavigationBarItem(
          
          icon: Icon(Icons.bar_chart_outlined), 
          label: 'Gráficos'
        
        ),

        BottomNavigationBarItem(
          
          icon: Icon(Icons.settings), 
          label: 'Configuración'
        
        ),

      ],
      
    );

  }

}

