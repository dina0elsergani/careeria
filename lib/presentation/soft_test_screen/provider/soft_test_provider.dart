import 'dart:convert';
import 'package:careeria/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/soft_test_model.dart';

class SoftSkillQuestion {
  final int id;
  final int softSkillId;
  final String question;
  final String? createdAt;
  final String? updatedAt;

  SoftSkillQuestion({
    required this.id,
    required this.softSkillId,
    required this.question,
    this.createdAt,
    this.updatedAt,
  });

  factory SoftSkillQuestion.fromJson(Map<String, dynamic> json) {
    return SoftSkillQuestion(
      id: json['id'] ?? 0,
      softSkillId: json['soft_skill_id'] ?? 0,
      question: json['question'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class SoftTestProvider extends ChangeNotifier {
  SoftTestModel softTestModelObj = SoftTestModel();
  Map<int, String?> selectedAnswers = {}; // Map to store selected answers for each question
  List<SoftSkillQuestion> softSkillQuestions = []; // List to store questions

  SoftTestProvider() {
    fetchSoftSkillQuestions(); // Call API fetch on initialization
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateSelectedAnswer(int questionId, String? answer) {
    selectedAnswers[questionId] = answer;
    notifyListeners();
  }

  Future<void> fetchSoftSkillQuestions() async {
    final url = Uri.parse('$apiUrl/api/v1/softskillsquestions');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        softSkillQuestions = responseData
            .map((json) => SoftSkillQuestion.fromJson(json))
            .toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Failed to load questions');
    }
  }

  Future<void> submitTest(Map<String, dynamic> responses) async {
    final url = Uri.parse('$apiUrl/api/v1/soft-skills-test');
    print('responses ${responses}');
    try {
      final response = await http.post(
        url,
        body: json.encode(responses),
        headers: {'Content-Type': 'application/json'},
      );
      print(' response ${response.body}');
      if (response.statusCode == 200) {
        // Handle successful submission
        print('Test submitted successfully');
      } else {
        throw Exception('Failed to submit test');
      }
    } catch (e) {
      throw Exception('Failed to submit test');
    }
  }
  Future<void> saveWeaknesses(List<String> weaknesses) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('weaknesses', weaknesses);
    } catch (error) {
      print('Failed to save weaknesses: $error');
      throw error; // Handle error appropriately in your UI
    }
  }
}
