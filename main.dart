import 'package:flutter/material.dart';
// استيراد الشاشات من مجلد screens
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/instructions_screen.dart';
import 'screens/numbers_screen.dart';

void main() {
  runApp(const NajdaApp());
}

class NajdaApp extends StatelessWidget {
  const NajdaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق نجدة',

      // إعداد الثيم العام للتطبيق (اختياري لتحسين المظهر)
      theme: ThemeData(
        primaryColor: const Color(0xFF23297A),
        fontFamily: 'Tajawal', // تأكد من إضافة الخط في pubspec.yaml إذا أردت استخدامه
        useMaterial3: true,
      ),

      // تعريف المسار الابتدائي (الشاشة التي تفتح أولاً)
      initialRoute: '/',

      // جدول المسارات (Routes) لربط الأسماء بالصفحات
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/instructions': (context) => const InstructionsScreen(),
        '/numbers': (context) => const NumbersScreen(),
      },

      // اتجاه النص من اليمين لليسار لأن التطبيق باللغة العربية
      locale: const Locale('ar', 'YE'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}