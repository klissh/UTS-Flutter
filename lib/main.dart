import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/schedule_detail_page.dart';
import 'models/schedule_model.dart';
import 'pages/splash_screen.dart'; 


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Penjadwalan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const SplashScreen(), // Ganti dengan SplashScreen
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final List<ScheduleItem> schedules = [
    ScheduleItem(
      title: 'Rapat Tim',
      time: '09:00',
      icon: FontAwesomeIcons.briefcase,
      color: Colors.blue,
      details: ScheduleDetails(
        name: 'Rapat Tim',
        type: 'Meeting',
        startTime: '09:00',
        endTime: '10:00',
        description: 'Diskusi strategi proyek Q4.',
      ),
    ),
    ScheduleItem(
      title: 'Olahraga Pagi',
      time: '07:30',
      icon: FontAwesomeIcons.dumbbell,
      color: Colors.green,
      details: ScheduleDetails(
        name: 'Olahraga Pagi',
        type: 'Exercise',
        startTime: '07:30',
        endTime: '08:30',
        description: 'Lari pagi di taman kota.',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STT Penjadwalan'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            final schedule = schedules[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleDetailPage(schedule.details),
                  ),
                );
              },
              child: _buildScheduleItem(
                title: schedule.title,
                time: schedule.time,
                icon: schedule.icon,
                color: schedule.color,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildScheduleItem({
    required String title,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(time, style: TextStyle(color: Colors.grey[400])),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleItem {
  final String title;
  final String time;
  final IconData icon;
  final Color color;
  final ScheduleDetails details;

  ScheduleItem({
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
    required this.details,
  });

  
}