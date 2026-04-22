import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// استيراد الشاشات (تأكد أن أسماء الملفات تطابق ما لديك)
import 'screens/home_screen.dart';
import 'screens/numbers_screen.dart';
import 'screens/instructions_screen.dart';
import 'screens/about_screen.dart';

// استيراد البروفايدر
import 'providers/emergent_provider.dart';

void main() {
  // لضمان عمل الخدمات المصغرة مثل Shared Preferences قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // تغليف التطبيق بالـ Provider ليكون متاحاً في جميع الشاشات
    ChangeNotifierProvider(
      create: (context) => EmergencyProvider(),
      child: const NajdaApp(),
    ),
  );
}

class NajdaApp extends StatelessWidget {
  const NajdaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق نجدة',

      // إعدادات الثيم (الألوان الأساسية للتطبيق)
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red, // اللون الأحمر الأساسي للطوارئ
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),

      // تعريف المسارات (Routes) للتنقل بين الشاشات
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/numbers': (context) => const NumbersScreen(),
        '/instructions': (context) => const InstructionsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}