import 'dart:convert';
import 'package:careeria/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:careeria/core/app_export.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_title.dart';
import 'package:careeria/widgets/custom_radio_button.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider/technical_test_provider.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class TechnicalTestScreen extends StatefulWidget {
  const TechnicalTestScreen({Key? key}) : super(key: key);

  @override
  TechnicalTestScreenState createState() => TechnicalTestScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TechnicalTestProvider(),
        child: TechnicalTestScreen());
  }
}

class TechnicalTestScreenState extends State<TechnicalTestScreen> {
  final List<String> skills = [
    'Database Fundamentals',
    'Computer Architecture',
    'Distributed Computing Systems',
    'Cyber Security',
    'Networking',
    'Software Development',
    'Programming Skills',
    'Computer Forensics Fundamentals',
    'AI ML',
    'Software Engineering',
    'Data Science',
    'Graphics Designing',
    'CV',
    'NLP',
    'Machine Learning'
  ];

  final List<String> answers = [
    'Not Interested',
    'Poor',
    'Average',
    'Beginner',
    'Intermediate',
    'Excellent',
    'Professional'
  ];

  int currentQuestionIndex = 0;

  void updateQuestionIndex(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildQuestionNumberRow(),
                      SizedBox(height: 40.v),
                      Expanded(child: _buildQuestion(context, skills[currentQuestionIndex])),
                      SizedBox(height: 40.v),
                      _buildTf(context),
                      SizedBox(height: 5.v)
                    ]))));
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
        title: AppbarTitle(text: "Technical Test"));
  }

  Widget _buildQuestionNumberRow() {
    return Container(
      height: 40, // Set a fixed height for the row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: skills.length,
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

  Widget _buildQuestion(BuildContext context, String skill) {
    return Consumer<TechnicalTestProvider>(builder: (context, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rate your skills in $skill:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
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
                    groupValue: provider.getRadioGroup(skill),
                    padding: EdgeInsets.symmetric(vertical: 3.v),
                    backgroundColor: Colors.transparent,
                    onChange: (value) {
                      provider.changeRadioButton1(skill, value);
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.v),
        ],
      );
    });
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomElevatedButton(
              height: 44.v,
              text: "Cancel",
              margin: EdgeInsets.only(right: 14.h),
              buttonStyle: CustomButtonStyles.fillWhiteA,
              buttonTextStyle: CustomTextStyles.titleLargePrimary_1)),
      Expanded(
          child: CustomElevatedButton(
              height: 44.v,
              text: "Done",
              margin: EdgeInsets.only(left: 14.h),
              buttonTextStyle: Theme.of(context).textTheme.titleLarge!,
              onPressed: () {
                onTapDone(context);
              }))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

onTapDone(BuildContext context) async {
  final provider = Provider.of<TechnicalTestProvider>(context, listen: false);
  final answers = provider.getAnswers();
  answers['user_id'] = userId as String;  // Ensure user ID is included
  print('answers $answers');

  // Send the data to the backend
  final response = await http.post(
    Uri.parse('${apiUrl}/api/v1/techtestresponses'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(answers),
  );

  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    // Decode the JSON response body
    final body = json.decode(response.body);

    // Safely access 'prediction' and 'role' from the response
    if (body['prediction'] != null && body['prediction']['role'] != null) {
      final role = body['prediction']['role'];
      await prefs.setString('userTrack', role);
      print('role ${role}');
      // Navigate to the result screen with the prediction data
      NavigatorService.pushNamed(AppRoutes.techTestResultScreen, arguments: body['prediction']);
    } else {
      print('Prediction data or role is missing');
    }
  } else {
    // Handle error
    print('Failed to get prediction: ${response.body}');
  }
}

}
