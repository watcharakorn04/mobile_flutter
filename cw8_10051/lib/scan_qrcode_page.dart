import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrcodePage extends StatefulWidget {
  const ScanQrcodePage({super.key});

  @override
  State<ScanQrcodePage> createState() => _ScanQrcodePageState();
}

class _ScanQrcodePageState extends State<ScanQrcodePage> {
  String result = 'ยังไม่มีข้อมูล';
  bool isScanning = false;
  bool qrOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('QR & Barcode Scanner'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        leading: isScanning
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    isScanning = false;
                  });
                },
              )
            : null,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          if (!isScanning) ...[
            _scanButton(
              text: 'Scan QR Code',
              icon: Icons.qr_code,
              onTap: () {
                setState(() {
                  isScanning = true;
                  qrOnly = true;
                });
              },
            ),
            const SizedBox(height: 15),
            _scanButton(
              text: 'Scan Barcode',
              icon: Icons.document_scanner,
              onTap: () {
                setState(() {
                  isScanning = true;
                  qrOnly = false;
                });
              },
            ),
          ],
          if (isScanning) ...[
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 280,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.lightBlue, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: MobileScanner(
                  onDetect: (capture) {
                    final barcode = capture.barcodes.first;

                    if (qrOnly && barcode.format != BarcodeFormat.qrCode) {
                      return;
                    }

                    final String? code = barcode.rawValue;
                    if (code == null) return;

                    setState(() {
                      result = code;
                      isScanning = false;
                    });
                  },
                ),
              ),
            ),
          ],
          const SizedBox(height: 30),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'ผลลัพธ์ที่สแกนได้',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scanButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        onPressed: onTap,
      ),
    );
  }
}
