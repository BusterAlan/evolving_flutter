import 'package:evolving_flutter/providers/shared_pref.dart';
import 'package:flutter/material.dart';

class DarkModeSwitch extends StatefulWidget {

  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();

}

class _DarkModeSwitchState extends State<DarkModeSwitch> {

  bool? dM;
  final _prefs = UserPrefs();

  @override
  void initState() {

    super.initState();
    dM = _prefs.darkMode;

  }

  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
      
      value: dM!, 
      title: const Text(
        
        'Modo obscuro',
        style: TextStyle(

          fontSize: 14

        ),
        
      ),

      subtitle: const Text('El modo obscuro ayuda a ahorrar batería'),
      onChanged: (bool value) { 

        setState(() {
          
          dM = value;
          _prefs.darkMode = value;

        });

      },
      
    );

  }

}

