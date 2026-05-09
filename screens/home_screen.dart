import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'طبي',
        'icon': Icons.medical_services_rounded,
        'color': const Color(0xFFFF4D4D),
        'arg': 'medical'
      },
      {
        'title': 'أمني',
        'icon': Icons.shield_rounded,
        'color': const Color(0xFF4D94FF),
        'arg': 'security'
      },
      {
        'title': 'إطفاء',
        'icon': Icons.fire_truck_rounded,
        'color': const Color(0xFFFF944D),
        'arg': 'fire'
      },
      {
        'title': 'خدمات',
        'icon': Icons.settings_suggest_rounded,
        'color': const Color(0xFF4DFF4D),
        'arg': 'services'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),

      // القائمة الجانبية (Drawer)
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF23297A)),
              child: Center(
                child: Text(
                  'تطبيق نجدة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFF23297A)),
              title: const Text('عن التطبيق'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Color(0xFF23297A)),
              title: const Text('إرشادات الاستخدام'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/instructions');
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WavyClipper(),
                child: Container(
                  // تم ضبط الارتفاع ليكون متناسقاً مع رفع النص
                  height: MediaQuery.of(context).size.height * 0.36,
                  color: const Color(0xFF23297A),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5), // تقليل المسافة العلوية جداً
                          child: Builder(
                            builder: (context) => IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                              onPressed: () => Scaffold.of(context).openDrawer(),
                            ),
                          ),
                        ),
                      ),
                      // تم حذف SizedBox الزائد هنا لرفع النص مباشرة
                      const Center(
                        child: Text(
                          'تطبيق نجدة\nخدمات الطوارئ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.1, // تقريب الأسطر من بعضها قليلاً
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.9,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, '/numbers', arguments: item['arg']),
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: item['color'].withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon'],
                            size: 55,
                            color: item['color'],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF23297A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    var firstStart = Offset(size.width * 0.25, size.height - 100);
    var firstEnd = Offset(size.width * 0.5, size.height - 60);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width * 0.75, size.height - 20);
    var secondEnd = Offset(size.width, size.height - 60);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}