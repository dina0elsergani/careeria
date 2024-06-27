import 'package:flutter/material.dart';

class TechnicalTestProvider extends ChangeNotifier {
  Map<String, String> _answers = {};

  String getRadioGroup(String skill) {
    // Convert skill to lowercase and replace spaces with underscores
    String formattedSkill = "${skill.toLowerCase().replaceAll(' ', '_')}_answer";
    return _answers[formattedSkill] ?? '';
  }

  void changeRadioButton1(String skill, String value) {
    // Convert skill to lowercase and replace spaces with underscores
    String formattedSkill = "${skill.toLowerCase().replaceAll(' ', '_')}_answer";
    _answers[formattedSkill] = value;
    notifyListeners();
  }

  Map<String, String> getAnswers() {
    return _answers;
  }
}
