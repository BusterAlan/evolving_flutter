import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {

  final FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

  initialize() async {

    AndroidInitializationSettings androidInit = const AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initSettings = InitializationSettings(
      
      android: androidInit
      
    );

    AndroidFlutterLocalNotificationsPlugin aflnp = AndroidFlutterLocalNotificationsPlugin();
    aflnp.requestExactAlarmsPermission();
    aflnp.requestNotificationsPermission();

    await plugin.initialize(initSettings);

  }

  dailyNotification(int hour, int minute) async {

    final String currentTime = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTime));
    tz.TZDateTime utcTime = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(

      tz.local,
      utcTime.year,
      utcTime.month,
      utcTime.day,
      hour,
      minute

    );

    if (scheduleDate.isBefore(utcTime)) {

      scheduleDate = scheduleDate.add(const Duration(days: 1));

    }

    var androidDetails = const AndroidNotificationDetails(
      
      '1', 
      'name'
      
    );

    var platform = NotificationDetails(

      android: androidDetails

    );

    await plugin.zonedSchedule(
      
      1, 
      '¡Llegó el momento!', 
      'No olvides registrar tus gastos, es prioritario tener un orden de tus finanzas personales.', 
      scheduleDate,
      platform, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,   
      
    );

  }

  cancel() async {

    await plugin.cancelAll();

  }

}

