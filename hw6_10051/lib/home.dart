import 'package:flutter/material.dart';
import 'result.dart';

/* ================= หน้า Input ================= */

class GradeInputPage extends StatefulWidget {
  const GradeInputPage({super.key});

  @override
  State<GradeInputPage> createState() => _GradeInputPageState();
}

class _GradeInputPageState extends State<GradeInputPage> {
  final nameCtrl = TextEditingController();
  final surnameCtrl = TextEditingController();

  String major = 'INE';

  final List<String> subjects = [
    'INTRO TO INFO & NETWORK ENG',
    'COMPUTER PROGRAMMING',
    'DISCRETE MATH & APPLICATION',
    'DESIGN THINKING',
  ];
  final List<String> selectedSubjects = List.generate(
    4,
    (_) => 'INTRO TO INFO & NETWORK ENG',
  );

  final List<TextEditingController> scoreCtrl = List.generate(
    12,
    (_) => TextEditingController(),
  );

  void calculateGrade() {
    List<Map<String, dynamic>> results = [];

    for (int i = 0; i < 4; i++) {
      int base = i * 3;
      int keep = int.tryParse(scoreCtrl[base].text) ?? 0;
      int mid = int.tryParse(scoreCtrl[base + 1].text) ?? 0;
      int fin = int.tryParse(scoreCtrl[base + 2].text) ?? 0;

      int total = keep + mid + fin;
      String grade = getGrade(total);

      results.add({
        'subject': selectedSubjects[i],
        'keep': keep,
        'mid': mid,
        'final': fin,
        'total': total,
        'grade': grade,
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          name: nameCtrl.text,
          surname: surnameCtrl.text,
          major: major,
          results: results,
        ),
      ),
    );
  }

  String getGrade(int score) {
    if (score > 100 || score < 0) return 'Invalid';
    if (score >= 80) return 'A';
    if (score >= 75) return 'B+';
    if (score >= 70) return 'B';
    if (score >= 65) return 'C+';
    if (score >= 60) return 'C';
    if (score >= 55) return 'D+';
    if (score >= 50) return 'D';
    return 'F';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grade Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. ข้อมูลนักศึกษา', style: TextStyle(fontSize: 18)),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'ชื่อ'),
            ),
            TextField(
              controller: surnameCtrl,
              decoration: const InputDecoration(labelText: 'นามสกุล'),
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                const Text('สาขา: '),
                Radio<String>(
                  value: 'INE',
                  groupValue: major,
                  onChanged: (v) => setState(() => major = v!),
                ),
                const Text('INE'),
                Radio<String>(
                  value: 'INET',
                  groupValue: major,
                  onChanged: (v) => setState(() => major = v!),
                ),
                const Text('INET'),
              ],
            ),

            const Divider(),
            const Text('2. รายวิชาและคะแนน', style: TextStyle(fontSize: 18)),

            for (int i = 0; i < 4; i++) courseCard(i),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calculateGrade,
                child: const Text('คำนวณเกรด'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget courseCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('วิชา ${index + 1}'),
            DropdownButton<String>(
              value: selectedSubjects[index],
              items: subjects
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => selectedSubjects[index] = v!),
            ),
            Row(
              children: [
                scoreBox(scoreCtrl[index * 3], 'คะแนนเก็บ'),
                scoreBox(scoreCtrl[index * 3 + 1], 'คะแนนกลางภาค'),
                scoreBox(scoreCtrl[index * 3 + 2], 'คะแนนปลายภาค'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget scoreBox(TextEditingController ctrl, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: label),
        ),
      ),
    );
  }
}
