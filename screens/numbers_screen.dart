import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استلام نوع القسم (طبي، أمني...) من الشاشة الرئيسية
    final String category = ModalRoute.of(context)!.settings.arguments as String? ?? 'services';

    // بيانات الأرقام (مثال لمشروعك)
    final Map<String, List<Map<String, String>>> emergencyData = {
      'medical': [
        {'name': 'الإسعاف', 'number': '997'},
        {'name': 'الهلال الأحمر', 'number': '998'},
      ],
      'security': [
        {'name': 'الشرطة', 'number': '999'},
        {'name': 'أمن الطرق', 'number': '996'},
      ],
      'fire': [
        {'name': 'الدفاع المدني', 'number': '998'},
      ],
      'services': [
        {'name': 'طوارئ الكهرباء', 'number': '933'},
        {'name': 'طوارئ المياه', 'number': '939'},
      ],
    };

    final List<Map<String, String>> currentNumbers = emergencyData[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('أرقام الطوارئ')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: currentNumbers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.phone_in_talk, color: Colors.red),
              title: Text(currentNumbers[index]['name']!),
              subtitle: Text(currentNumbers[index]['number']!),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed: () async {
                  final Uri url = Uri.parse('tel:${currentNumbers[index]['number']}');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}