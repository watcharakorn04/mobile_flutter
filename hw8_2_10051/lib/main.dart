import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  await DatabaseHelper.instance.initializeUsers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final userMaps = await DatabaseHelper.instance.queryAllUsers();
    setState(() {
      users = userMaps.map((map) => User.fromMap(map)).toList();
    });
  }

  Future<void> _deleteUser(int userId) async {
    await DatabaseHelper.instance.deleteUser(userId);
    await _fetchUsers();
  }

  Future<void> _deleteAllUsers() async {
    await DatabaseHelper.instance.deleteAllUsers();
    await _fetchUsers();
  }

  // --- ส่วนของ Dialog ตกแต่ง TextField ให้ดูง่ายขึ้น ---
  Widget _buildTextField(TextEditingController controller, String label, {bool isNum = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: isNum ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(), // เพิ่มขอบให้ช่องกรอกข้อมูล
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  void _editUser(User user) {
    TextEditingController usernameController = TextEditingController(text: user.username);
    TextEditingController emailController = TextEditingController(text: user.email);
    TextEditingController pwdController = TextEditingController(text: user.pwd);
    TextEditingController weightController = TextEditingController(text: user.weight.toString());
    TextEditingController heightController = TextEditingController(text: user.height.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit User Information'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(usernameController, 'Username'),
              _buildTextField(emailController, 'Email'),
              _buildTextField(pwdController, 'Password'),
              _buildTextField(weightController, 'Weight', isNum: true),
              _buildTextField(heightController, 'Height', isNum: true),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              User updatedUser = User(
                id: user.id,
                username: usernameController.text,
                email: emailController.text,
                pwd: pwdController.text,
                weight: double.parse(weightController.text),
                height: double.parse(heightController.text),
              );
              await DatabaseHelper.instance.updateUser(updatedUser);
              await _fetchUsers();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _addUser() {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New User'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(usernameController, 'Username'),
              _buildTextField(emailController, 'Email'),
              _buildTextField(pwdController, 'Password'),
              _buildTextField(weightController, 'Weight', isNum: true),
              _buildTextField(heightController, 'Height', isNum: true),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              User newUser = User(
                username: usernameController.text,
                email: emailController.text,
                pwd: pwdController.text,
                weight: double.parse(weightController.text),
                height: double.parse(heightController.text),
              );
              await DatabaseHelper.instance.insertUser(newUser);
              await _fetchUsers();
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // เปลี่ยนสีพื้นหลังให้อ่อนลงเพื่อให้ Card เด่นขึ้น
      appBar: AppBar(
        title: const Text('Show Users List'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _deleteAllUsers,
          ),
        ],
      ),
      body: users.isEmpty
          ? const Center(child: Text('No users found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Image.asset(user.imagePath, height: 60),
                    title: Text(
                      user.username,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('BMI: ${user.bmi.toStringAsFixed(2)} (${user.bmiType})'),
                        const SizedBox(height: 4),
                        Text(
                          user.bmiType == "Normal weight"
                              ? "✅ Weight is Normal"
                              : "${user.bmi < 23 ? '⬆️ Gain' : '⬇️ Lose'} ${user.weightToAdjust.toStringAsFixed(2)} kg",
                          style: TextStyle(
                            color: user.bmiType == "Normal weight" ? Colors.green : Colors.orange[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('Target: ${user.targetWeight.toStringAsFixed(2)} kg',
                            style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 0,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editUser(user),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteUser(user.id!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}