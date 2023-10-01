import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime currentDateTime = DateTime.now();
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  String am_pm = '';
  String currentWeekDay = '';
  int currentDay = 0;
  String currentMonth = '';
  int currentYear = 0;
  String timeString = '';
  String dateString = '';

  String getGreeting() {
    if (currentDateTime.hour < 12) {
      return 'Good Morning!';
    } else if (currentDateTime.hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  @override
  void initState(){
    super.initState();
    startTimer();
  }

  void startTimer(){
    const period = Duration(seconds: 1);

    Timer.periodic(period, (Timer timer) {
      setState(() {
        currentDateTime = DateTime.now();
        currentWeekDay = currentDateTime.weekday == 1 ? 'Monday' : currentDateTime.weekday == 2 ? 'Tuesday' : currentDateTime.weekday == 3 ? 'Wednesday' : currentDateTime.weekday == 4 ? 'Thursday' : currentDateTime.weekday == 5 ? 'Friday' : currentDateTime.weekday == 6 ? 'Saturday' : currentDateTime.weekday == 7 ? 'Sunday' : '';
        currentDay = currentDateTime.day;
        currentMonth = currentDateTime.month == 1 ? 'January' : currentDateTime.month == 2 ? 'February' : currentDateTime.month == 3 ? 'March' : currentDateTime.month == 4 ? 'April' : currentDateTime.month == 5 ? 'May' : currentDateTime.month == 6 ? 'June' : currentDateTime.month == 7 ? 'July' : currentDateTime.month == 8 ? 'August' : currentDateTime.month == 9 ? 'September' : currentDateTime.month == 10 ? 'October' : currentDateTime.month == 11 ? 'November' : currentDateTime.month == 12 ? 'December' : '';
        currentYear = currentDateTime.year;
        int t_hours = currentDateTime.hour;
        hours = (t_hours > 12) ? (t_hours % 12) : (t_hours == 0) ? 12 : t_hours;
        minutes = currentDateTime.minute;
        seconds = currentDateTime.second;
        am_pm = t_hours < 12 ? 'AM' : 'PM';
        if(t_hours == 12) {
          am_pm = 'PM';
        }
        timeString = '${hours < 10 ? '0$hours' : '$hours'}:${minutes < 10 ? '0$minutes' : '$minutes'}:${seconds < 10 ? '0$seconds' : '$seconds'} $am_pm';
        dateString = '$currentWeekDay, $currentDay $currentMonth $currentYear';


      });

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Clock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(getGreeting(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black)),
            SizedBox(height: 50),
            Text(dateString, style: TextStyle(fontSize: 30, color: Colors.black),),
            SizedBox(height: 20),
            Text(timeString, style: TextStyle(fontSize: 30, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
