import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// استيراد الموديل من ملفه الخاص (هذا يغني عن كتابة الكلاس هنا)
import '../models/contact_model.dart';

class EmergencyProvider with ChangeNotifier {
  List<PersonalContact> _personalContacts = [];

  // الحصول على قائمة الأرقام الشخصية
  List<PersonalContact> get personalContacts => _personalContacts;

  EmergencyProvider() {
    loadContacts(); // تحميل الأرقام بمجرد تشغيل التطبيق
  }

  // إضافة رقم جديد
  Future<void> addContact(String name, String number) async {
    _personalContacts.add(PersonalContact(name: name, number: number));
    await saveToPrefs();
    notifyListeners(); // تحديث الواجهات فوراً
  }

  // حذف رقم
  Future<void> removeContact(int index) async {
    _personalContacts.removeAt(index);
    await saveToPrefs();
    notifyListeners();
  }

  // حفظ البيانات في ذاكرة الهاتف باستخدام SharedPreferences
  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      _personalContacts.map((item) => item.toJson()).toList(),
    );
    await prefs.setString('personal_contacts', encodedData);
  }

  // استرجاع البيانات من ذاكرة الهاتف
  Future<void> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString('personal_contacts');
    if (savedData != null) {
      final List<dynamic> decodedData = jsonDecode(savedData);
      _personalContacts = decodedData
          .map((item) => PersonalContact.fromJson(item))
          .toList();
      notifyListeners();
    }
  }
}