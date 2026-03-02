import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final CollectionReference bmiCollection = FirebaseFirestore.instance
      .collection('bmi_records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Cal BMI (10051)',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: bmiCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  docs[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 3,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('Name: ${data['name']}'),
                  subtitle: Text(
                    'Weight: ${data['weight']} kg | Height: ${data['height']} cm\n'
                    'BMI: ${data['bmi']}',
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => showEditBmiDialog(docs[index]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              bmiCollection.doc(docs[index].id).delete(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => showAddBmiDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void showAddBmiDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add BMI Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                double weight = double.tryParse(weightController.text) ?? 0;
                double heightCm = double.tryParse(heightController.text) ?? 0;

                if (name.isNotEmpty && weight > 0 && heightCm > 0) {
                  double heightM = heightCm / 100;
                  double bmiValue = weight / (heightM * heightM);
                  String formattedBmi = bmiValue.toStringAsFixed(2);

                  await bmiCollection.add({
                    'name': name,
                    'weight': weight,
                    'height': heightCm,
                    'bmi': formattedBmi,
                  });

                  if (context.mounted) Navigator.pop(context);
                } else {
                  print('Please fill in all fields with valid numbers');
                }
              },
              child: const Text('Cal and Save'),
            ),
          ],
        );
      },
    );
  }

  void showEditBmiDialog(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    TextEditingController nameController = TextEditingController(
      text: data['name'],
    );
    TextEditingController weightController = TextEditingController(
      text: data['weight'].toString(),
    );
    TextEditingController heightController = TextEditingController(
      text: data['height'].toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit BMI Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                double weight = double.tryParse(weightController.text) ?? 0;
                double heightCm = double.tryParse(heightController.text) ?? 0;

                if (name.isNotEmpty && weight > 0 && heightCm > 0) {
                  double heightM = heightCm / 100;
                  double bmiValue = weight / (heightM * heightM);
                  String formattedBmi = bmiValue.toStringAsFixed(2);

                  await bmiCollection.doc(document.id).update({
                    'name': name,
                    'weight': weight,
                    'height': heightCm,
                    'bmi': formattedBmi,
                  });

                  if (context.mounted) Navigator.pop(context);
                } else {
                  print('Please fill in all fields with valid numbers');
                }
              },
              child: const Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }
}
