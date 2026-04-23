import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الإرشادات (يمكنك إضافة المزيد منها لاحقاً)
    final List<Map<String, String>> instructions = [
      {
        'title': 'إسعافات أولية (الجروح)',
        'desc': 'قم بتنظيف الجرح بلطف واضغط عليه بقطعة قماش نظيفة لوقف النزيف.'
      },
      {
        'title': 'حالات الإغماء',
        'desc': 'ضع الشخص على ظهره وارفع قدميه قليلاً عن مستوى الأرض واطلب الإسعاف.'
      },
      {
        'title': 'حرائق المنزل',
        'desc': 'اخفض رأسك لتجنب استنشاق الدخان، وغادر المكان فوراً دون استخدام المصعد.'
      },
      {
        'title': 'التعامل مع الكسور',
        'desc': 'لا تحرك الجزء المكسور، وحاول تثبيته بقطعة خشب أو كرتون حتى وصول الطبيب.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('إرشادات السلامة'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: instructions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              leading: const Icon(Icons.info, color: Colors.orange),
              title: Text(
                instructions[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    instructions[index]['desc']!,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}