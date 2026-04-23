import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // شعار التطبيق أو أيقونة تعبيرية
              const Icon(
                Icons.health_and_safety,
                size: 100,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              const Text(
                'تطبيق نجدة (Quick Help)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'الإصدار 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
              const Divider(height: 40),
              const Text(
                'هذا التطبيق هو مشروع الفلاتر يهدف إلى تسهيل الوصول لأرقام الطوارئ والخدمات الأساسية وإدارة الأرقام الشخصية في الحالات الحرجة.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              const Text(
                'إعداد الطالبة:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                'أفنان العنبري',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              const Spacer(),
              const Text(
                'تم التطوير باستخدام Flutter & Dart',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}