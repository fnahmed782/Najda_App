class PersonalContact {
  final String name;
  final String number;


  PersonalContact({
    required this.name,
    required this.number,

  });

  // تحويل من JSON (مهم جداً لأنك تستخدم SharedPreferences)
  factory PersonalContact.fromJson(Map<String, dynamic> json) {
    return PersonalContact(
      name: json['name'],
      number: json['number'],
    );
  }

  // تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,

    };
  }
}