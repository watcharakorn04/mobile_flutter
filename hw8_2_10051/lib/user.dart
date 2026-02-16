class User {
  final int? id;
  final String username;
  final String email;
  final String pwd;
  final double weight;
  final double height;

  final double bmi;
  final String bmiType;
  final double targetWeight;
  final double weightToAdjust;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.pwd,
    required this.weight,
    required this.height,
  }) : bmi = weight / ((height / 100) * (height / 100)),
       bmiType = _getBmiType(weight / ((height / 100) * (height / 100))),
       targetWeight = _calculateTarget(weight, height),
       weightToAdjust = (_calculateTarget(weight, height) - weight).abs();

  static String _getBmiType(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 23) return "Normal weight";
    if (bmi < 25) return "Risk to Overweight";
    if (bmi < 30) return "Overweight";
    return "Obesity";
  }

  static double _calculateTarget(double weight, double height) {
    double h = (height / 100) * (height / 100);
    double bmi = weight / h;

    if (bmi < 18.5) return 18.5 * h;
    if (bmi > 22.9) return 22.9 * h;
    return weight;
  }

  String get imagePath {
    switch (bmiType) {
      case "Underweight":
        return "assets/images/bmi-1.png";
      case "Normal weight":
        return "assets/images/bmi-2.png";
      case "Risk to Overweight":
        return "assets/images/bmi-3.png";
      case "Overweight":
        return "assets/images/bmi-4.png";
      default:
        return "assets/images/bmi-5.png";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'pwd': pwd,
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'bmiType': bmiType,
      'targetWeight': targetWeight,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      pwd: map['pwd'],
      weight: map['weight'],
      height: map['height'],
    );
  }
}
