import 'package:evolving_flutter/providers/local_notifications.dart';
import 'package:evolving_flutter/providers/shared_pref.dart';
import 'package:evolving_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class TimePicker extends StatefulWidget {

  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();

}

class _TimePickerState extends State<TimePicker> {

  final _prefs = UserPrefs();
  final _notifs = LocalNotifications();

  bool isEnable = false;
  String switchTitle = 'Activar notificaciones';

  void selectedTime() {

    int? hour;
    int? minute;

    showModalBottomSheet(
      
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      context: context, 
      builder: (context) {

        return Container(

          width: double.infinity,
          decoration: Constants.sheetBoxDecoration(context, null),
          child: SizedBox(
            
            height: 350,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TimePickerSpinner(

                  time: DateTime.now(),
                  is24HourMode: false,
                  spacing: 60,
                  itemWidth: 60,
                  itemHeight: 60,
                  isForce2Digits: true,
                  normalTextStyle: const TextStyle(

                    fontSize: 30,

                  ),

                  highlightedTextStyle: const TextStyle(

                    fontSize: 38,
                    color: Colors.green,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold

                  ),

                  onTimeChange: (DateTime time) {

                    setState(() {
                      
                      hour = time.hour;
                      minute = time.minute;

                    });

                  },

                ),

                Row(

                  children: [

                    Expanded(

                      child: GestureDetector(
                      
                        onTap: () {
                      
                          Navigator.pop(context);
                      
                        },
                      
                        child: Constants.customButton(
                          
                          Colors.transparent, 
                          Colors.red, 
                          'Cancelar'
                          
                        ),
                      
                      ),

                    ),

                    Expanded(

                      child: GestureDetector(
                      
                        onTap: () {

                          setState(() {
                            
                            _notifs.dailyNotification(hour!, minute!);
                            _prefs.hour = hour!;
                            _prefs.minute = minute!;

                          });
                      
                          Navigator.of(context).pop();
                      
                        },
                        
                        child: Constants.customButton(
                          
                          Colors.transparent, 
                          Colors.green, 
                          'Aceptar'
                          
                        ),
                      
                      ),

                    ),

                  ],

                )

              ],

            ),
            
          ),

        );

      }
      
    );
  
  }

  cancelNotifications(bool value) {

    if (value) {

      _prefs.hour = 8;
      _prefs.minute = 0;
      _notifs.dailyNotification(8, 0);

    } else {

      _prefs.deleteTime();
      _notifs.cancel();

    }

  }

  @override
  Widget build(BuildContext context) {

    final DateTime getDate = DateTime.now(); 

    String currentTime;

    if (_prefs.hour != 61) {

      final DateTime getTime = DateTime(

        getDate.year,
        getDate.month,
        getDate.day,
        _prefs.hour,
        _prefs.minute

      );

      currentTime = DateFormat.jm().format(getTime);
      switchTitle = 'Desactivar notificaciones';
      isEnable = true;

    } else {

      currentTime = '(Sin hora)';
      switchTitle = 'Activar notificaciones';
      isEnable = false;

    }

    return Column(

      children: [

        SwitchListTile(
          
          value: isEnable, 
          title: Text(switchTitle),

          onChanged: (val) {

            setState(() {

              isEnable = val;
              cancelNotifications(val);
              
            });

          }
          
        ),

        const Divider(thickness: 2),

        ListTile(
        
          leading: isEnable
          ? const Icon(Icons.notifications_active_outlined, size: 35) 
          : const Icon(Icons.notifications_off_outlined, size: 35),

          title: const Text('Recordatorio diario'),
          subtitle: Text(currentTime),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          enabled: isEnable,
          onTap: () {
        
            selectedTime();
        
          },
        
        ),

      ],

    );

  }

}

