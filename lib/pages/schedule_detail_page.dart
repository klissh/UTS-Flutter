import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/schedule_model.dart'; // Impor model

class ScheduleDetailPage extends StatelessWidget {
  final ScheduleDetails details;

  const ScheduleDetailPage(this.details, {super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi TextEditingController
    final nameController = TextEditingController(text: details.name);
    final typeController = TextEditingController(text: details.type);
    final startTimeController = TextEditingController(text: details.startTime);
    final endTimeController = TextEditingController(text: details.endTime);
    final descriptionController = TextEditingController(text: details.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Jadwal'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController, // Gunakan controller
              decoration: const InputDecoration(
                labelText: 'Nama Jadwal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: typeController, // Gunakan controller
              decoration: const InputDecoration(
                labelText: 'Tipe Pekerjaan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: startTimeController, // Gunakan controller
                    decoration: const InputDecoration(
                      labelText: 'Jam Mulai',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: endTimeController, // Gunakan controller
                    decoration: const InputDecoration(
                      labelText: 'Jam Selesai',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController, // Gunakan controller
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark, // Gunakan xmark alih-alih times
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.pen,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // Logika penyimpanan atau edit disini
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}