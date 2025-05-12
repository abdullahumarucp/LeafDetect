import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<DateTime> alarmTimes = [];

  @override
  void initState() {
    super.initState();
    NotificationService().init();
    _loadSavedAlarms();
  }

  Future<void> _loadSavedAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final times = prefs.getStringList('alarmTimes') ?? [];
    setState(() {
      alarmTimes = times.map((t) => DateTime.parse(t)).toList();
    });
  }

  Future<void> _saveAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final times = alarmTimes.map((dt) => dt.toIso8601String()).toList();
    await prefs.setStringList('alarmTimes', times);
  }

  Future<void> _addAlarm(DateTime time) async {
    alarmTimes.add(time);
    await _saveAlarms();
    await NotificationService().scheduleNotification(
      title: 'Water Your Plants',
      body: 'Time to water your plants!',
      scheduledTime: time,
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Alarm set for ${time.hour}:${time.minute.toString().padLeft(2, '0')}')),
      );
    }
    setState(() {});
  }

  Future<void> _cancelAllAlarms() async {
    await NotificationService().cancelAllAlarms();
    alarmTimes.clear();
    await _saveAlarms();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Care Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                DatePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (time) => _addAlarm(time),
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              child: const Text('Add New Alarm'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: alarmTimes.length,
                itemBuilder: (context, index) {
                  final time = alarmTimes[index];
                  return ListTile(
                    title: Text(
                        'Alarm at ${time.hour}:${time.minute.toString().padLeft(2, '0')}'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _cancelAllAlarms,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Cancel All Alarms'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // ✅ Timezone setup for Pakistan
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Karachi'));

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    if (Platform.isAndroid) {
      final androidPlugin =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin?.requestNotificationsPermission();
      await androidPlugin?.requestExactAlarmsPermission();
    }

    // Reschedule saved alarms
    final prefs = await SharedPreferences.getInstance();
    final times = prefs.getStringList('alarmTimes') ?? [];
    for (final t in times) {
      final dt = DateTime.parse(t);
      await scheduleNotification(
        title: 'Water Your Plants',
        body: 'Time to water your plants!',
        scheduledTime: dt,
      );
    }
  }

  int _generateId(DateTime dt) {
    return dt.millisecondsSinceEpoch.remainder(1000000);
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    final id = _generateId(scheduledTime);
    final tz.TZDateTime scheduledDate = _nextInstanceOfTime(scheduledTime);

    debugPrint("Scheduling notification at: $scheduledDate");

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'watering_channel',
          'Watering Reminders',
          channelDescription: 'Daily plant watering reminders',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelAllAlarms() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  tz.TZDateTime _nextInstanceOfTime(DateTime dt) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      dt.hour,
      dt.minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}
