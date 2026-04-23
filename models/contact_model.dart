class PersonalContact {
  final String name;
  final String number;

  PersonalContact({
    required this.name,
    required this.number,
  });

  // لتحويل الكائن إلى JSON عند الحفظ
  Map<String, dynamic> toJson() => {
    'name': name,
    'number': number,
  };

  // لاستعادة الكائن من JSON عند التحميل
  factory PersonalContact.fromJson(Map<String, dynamic> json) {
    return PersonalContact(
      name: json['name'],
      number: json['number'],
    );
  }
}