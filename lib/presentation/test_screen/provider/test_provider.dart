import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  Map<String, String> _answers = {};

  String getRadioGroup(String questionId) {
    return _answers[questionId] ?? '';
  }

  void changeRadioButton1(String questionId, String value) {
    _answers[questionId] = value;
    notifyListeners();
  }

  Map<String, String> getAnswers() {
    return _answers;
  }
}

