import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الأقسام الأساسية
    final List<Map<String, dynamic>> categories = [
      {'title': 'طبي', 'icon': Icons.medical_services, 'color': Colors.red, 'arg': 'medical'},
      {'title': 'أمني', 'icon': Icons.local_police, 'color': Colors.blue, 'arg': 'security'},
      {'title': 'إطفاء', 'icon': Icons.fire_truck, 'color': Colors.orange, 'arg': 'fire'},
      {'title': 'خدمات', 'icon': Icons.miscellaneous_services, 'color': Colors.green, 'arg': 'services'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق نجدة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/numbers',
                      arguments: categories[index]['arg'],
                    ),
                    child: Card(
                      elevation: 4,
                      color: categories[index]['color'],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(categories[index]['icon'], size: 50, color: Colors.white),
                          const SizedBox(height: 10),
                          Text(
                            categories[index]['title'],
                            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // أزرار الوصول السريع في الأسفل
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                    onPressed: () => Navigator.pushNamed(context, '/instructions'),
                    icon: const Icon(Icons.health_and_safety),
                    label: const Text('إرشادات السلامة'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}