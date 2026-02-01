import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String surname;
  final String major;
  final List<Map<String, dynamic>> results;

  const ResultPage({
    super.key,
    required this.name,
    required this.surname,
    required this.major,
    required this.results,
  });

  // ฟังก์ชันคำนวณ GPA เบื้องต้น (สมมติว่าทุกวิชาหน่วยกิตเท่ากัน)
  double calculateGPA() {
    if (results.isEmpty) return 0.0;
    double totalPoints = 0;
    for (var r in results) {
      switch (r['grade']) {
        case 'A': totalPoints += 4.0; break;
        case 'B+': totalPoints += 3.5; break;
        case 'B': totalPoints += 3.0; break;
        case 'C+': totalPoints += 2.5; break;
        case 'C': totalPoints += 2.0; break;
        case 'D+': totalPoints += 1.5; break;
        case 'D': totalPoints += 1.0; break;
        default: totalPoints += 0.0;
      }
    }
    return totalPoints / results.length;
  }

  Color gradeColor(String grade) {
    switch (grade) {
      case 'A': return Colors.green.shade700;
      case 'B+': return Colors.blue.shade600;
      case 'B': return Colors.blue.shade400;
      case 'C+': return Colors.teal.shade400;
      case 'C': return Colors.orange.shade600;
      case 'D+': return Colors.deepOrange.shade400;
      case 'D': return Colors.red.shade400;
      default: return Colors.red.shade900;
    }
  }

  @override
  Widget build(BuildContext context) {
    // จัดการกรณีค่าว่าง
    final displayName = name.isEmpty ? "ไม่ได้ระบุ" : name;
    final displaySurname = surname.isEmpty ? "" : surname;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('ผลการเรียนของคุณ', 
          style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // ส่วนหัว: Profile นักศึกษา
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                  child: const Icon(Icons.school, size: 45, color: Colors.redAccent),
                ),
                const SizedBox(height: 15),
                Text(
                  '$displayName $displaySurname',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Chip(
                  label: Text(major),
                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                  side: BorderSide.none,
                  labelStyle: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // ส่วนเนื้อหา: ตารางเกรด
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    // ตาราง
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: SingleChildScrollView(
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(2.2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1.2),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(color: Colors.grey.shade100),
                                children: const [
                                  TableCellWidget(text: 'วิชา', isHeader: true),
                                  TableCellWidget(text: 'เก็บ', isHeader: true),
                                  TableCellWidget(text: 'กลาง', isHeader: true),
                                  TableCellWidget(text: 'ปลาย', isHeader: true),
                                  TableCellWidget(text: 'รวม', isHeader: true),
                                  TableCellWidget(text: 'เกรด', isHeader: true),
                                ],
                              ),
                              for (var r in results)
                                TableRow(
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                                  ),
                                  children: [
                                    TableCellWidget(text: r['subject'], textAlign: TextAlign.left),
                                    TableCellWidget(text: r['keep'].toString()),
                                    TableCellWidget(text: r['mid'].toString()),
                                    TableCellWidget(text: r['final'].toString()),
                                    TableCellWidget(text: r['total'].toString()),
                                    TableCellWidget(
                                      text: r['grade'],
                                      color: gradeColor(r['grade']),
                                      isBold: true,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // แถบสรุป GPA ด้านล่าง Card
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('เกรดเฉลี่ยสะสม (GPA):', 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            calculateGPA().toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ปุ่มย้อนกลับ
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              label: const Text('กลับไปแก้ไขข้อมูล'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.redAccent, width: 1.2),
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

class TableCellWidget extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool isBold;
  final Color? color;
  final TextAlign textAlign;

  const TableCellWidget({
    super.key,
    required this.text,
    this.isHeader = false,
    this.isBold = false,
    this.color,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: 2,
        overflow: TextOverflow.ellipsis, // ป้องกันตัวอักษรล้น
        style: TextStyle(
          fontSize: isHeader ? 12 : 13,
          color: isHeader ? Colors.grey.shade600 : color ?? Colors.black87,
          fontWeight: isHeader || isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}