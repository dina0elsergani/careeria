import 'dart:convert';
import 'package:careeria/main.dart';
import 'package:careeria/presentation/soft_test_result_screen/models/soft_test_result_model.dart';
import 'package:careeria/presentation/soft_test_result_screen/soft_test_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:careeria/presentation/soft_test_screen/provider/soft_test_provider.dart';
import 'package:careeria/core/app_export.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_title.dart';
import 'package:careeria/widgets/custom_radio_button.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class SoftTestScreen extends StatefulWidget {
  const SoftTestScreen({Key? key}) : super(key: key);

  @override
  SoftTestScreenState createState() => SoftTestScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SoftTestProvider(),
      child: SoftTestScreen(),
    );
  }
}

class SoftTestScreenState extends State<SoftTestScreen> {
  final List<String> answers = [
    'Not Interested',
    'Poor',
    'Average',
    'Beginner',
    'Intermediate',
    'Good',
    'Very Good',
    'Excellent',
    'Professional',
    'Expert',
  ];

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 25.v),
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 65.v),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusStyle.roundedBorder15,
            image: DecorationImage(
              image: fs.Svg(ImageConstant.imgSignUp),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<SoftTestProvider>(
            builder: (context, provider, child) {
              if (provider.softSkillQuestions.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildQuestionNumberRow(provider),
                  SizedBox(height: 40.v),
                  Expanded(
                    child: _buildQuestion(
                      context,
                      provider.softSkillQuestions[currentQuestionIndex],
                      provider.selectedAnswers[provider.softSkillQuestions[currentQuestionIndex].id] ?? '',
                      provider.updateSelectedAnswer,
                    ),
                  ),
                  SizedBox(height: 40.v),
                  _buildTf(context, provider),
                  SizedBox(height: 5.v),
                ],
              );
            },
          ),

        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 32.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 22.h, top: 18.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Soft Test"));
  }

  Widget _buildQuestionNumberRow(SoftTestProvider provider) {
    return Container(
      height: 40, // Set a fixed height for the row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.softSkillQuestions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => updateQuestionIndex(index),
            child: Container(
              width: 40, // Width of the circle
              height: 40, // Height of the circle
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentQuestionIndex == index ? theme.colorScheme.primary : Colors.white,
                border: Border.all(color: theme.colorScheme.primary), // Optional border
              ),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: currentQuestionIndex == index ? Colors.white : theme.colorScheme.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuestion(BuildContext context, SoftSkillQuestion question, String selectedAnswer, Function(int, String?) updateSelectedAnswer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rate your skills in ${question.question}:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.v),
        Expanded(
          child: ListView.builder(
            itemCount: answers.length,
            itemBuilder: (context, index) {
              final answer = answers[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.v),
                child: CustomRadioButton(
                  text: answer,
                  value: answer,
                  groupValue: selectedAnswer == answer ? answer : null,
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  backgroundColor: Colors.transparent,
                  onChange: (value) {
                    updateSelectedAnswer(question.id, value);
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16.v),
      ],
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context, SoftTestProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            height: 44.v,
            text: "Cancel",
            margin: EdgeInsets.only(right: 14.h),
            buttonStyle: CustomButtonStyles.fillWhiteA,
            buttonTextStyle: CustomTextStyles.titleLargePrimary_1,
            onPressed: () {
              NavigatorService.goBack();
            },
          ),
        ),
        Expanded(
          child: CustomElevatedButton(
            height: 44.v,
            text: "Done",
            margin: EdgeInsets.only(left: 14.h),
            buttonTextStyle: Theme.of(context).textTheme.titleLarge!,
            onPressed: () {
              _submitTest(provider);
            },
          ),
        ),
      ],
    );
  }

void _submitTest(SoftTestProvider provider) async {
  // Prepare responses in the expected format
  Map<String, dynamic> responses = {};

  // Map soft skill IDs to their corresponding backend names
  final Map<int, String> softSkillMap = {
    1: 'Openness',
    2: 'Conscientousness',
    3: 'Extraversion',
    4: 'Agreeableness',
    5: 'Emotional_Range',
    6: 'Conversation',
    7: 'Openness_to_Change',
    8: 'Hedonism',
    9: 'Self-enhancement',
    10: 'Self-transcendence',
  };

  for (var question in provider.softSkillQuestions) {
    final softSkillName = softSkillMap[question.softSkillId];
    final answer = provider.selectedAnswers[question.id];
    if (softSkillName != null && answer != null) {
      responses[softSkillName] = answer;
    }
  }

  // Get the user ID from somewhere (assuming you have it available in Flutter)
  // For example, if you have it stored in your provider or globally
  String? userId = '3'; // Replace with your actual way of getting the user ID
  if (userId != null) {
    responses['user_id'] = userId;
  } else {
    // Handle case where user ID is not available (optional)
    print('User ID is null or not available');
    return;
  }

  try {
    // Call API or provider method to submit test
    await provider.submitTest(responses);

    // Save weaknesses in shared preferences upon successful submission
    List<String>? weaknesses = [
      'Openness',
      'Extraversion',
      'Agreeableness'
    ]; // Replace with actual weaknesses from API response

    await provider.saveWeaknesses(weaknesses);

    // Navigate to SoftTestResultScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SoftTestResultScreen(),
      ),
    );

    // Handle success (navigate to next screen, show success message, etc.)
    print('Test submitted successfully');
  } catch (error) {
    // Handle error (show error message, retry logic, etc.)
    print('Failed to submit test: $error');
  }
}



  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  void updateQuestionIndex(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
  }
}
