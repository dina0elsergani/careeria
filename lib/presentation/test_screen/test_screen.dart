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
import 'provider/test_provider.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  TestScreenState createState() => TestScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TestProvider(),
        child: TestScreen());
  }
}

class TestScreenState extends State<TestScreen> {
  int? roleId;
  List questions = [];
  String userTrack = ""; // Initial text

  int currentQuestionIndex = 0;

  void updateQuestionIndex(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserTrack();
    fetchRolesAndQuestions();
  }

  _loadUserTrack() async {
    final prefs = await SharedPreferences.getInstance();
    String track = prefs.getString('userTrack') ?? "Unknown"; 
    print("Loaded userTrack: $track");
    setState(() {
      userTrack = track;
    });
  }
  Future<void> fetchRolesAndQuestions() async {
    try {
      final rolesResponse = await http.get(Uri.parse('${apiUrl}/api/v1/roles'));
      if (rolesResponse.statusCode == 200) {
        print('succeeded');
        final Map<String, dynamic> data = json.decode(rolesResponse.body);
        final List<dynamic> roles = data['roles'];  // Adjusted to access the 'roles' key in the map
        final role = roles.firstWhere((role) => role['name'] == userTrack, orElse: () => null);
        if (role != null) {
          setState(() {
            roleId = role['id'];
          });
          await fetchQuestions(roleId!);
        }
      } else {
        print('Failed to fetch roles');
      }
    } catch (e) {
      print('Error fetching roles: $e');
    }
  }

  Future<void> fetchQuestions(int roleId) async {
    try {
      final response = await http.get(Uri.parse('${apiUrl}/api/v1/questions?role_id=$roleId'));
      if (response.statusCode == 200) {
        setState(() {
          questions = json.decode(response.body)['questions'];
          print('questions: $questions');
        });
      } else {
        print('Failed to fetch questions');
      }
    } catch (e) {
      print('Error fetching questions: $e');
    }
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
                      Expanded(child: _buildQuestion(context)),
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
        title: AppbarTitle(text: "Track Level Test"));
  }

  Widget _buildQuestionNumberRow() {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => updateQuestionIndex(index),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentQuestionIndex == index ? theme.colorScheme.primary : Colors.white,
                border: Border.all(color: theme.colorScheme.primary),
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

Widget _buildQuestion(BuildContext context) {
  if (questions.isEmpty) {
    return Center(child: CircularProgressIndicator());
  }

  final question = questions[currentQuestionIndex];
  final options = List<String>.from(json.decode(question['options']));

  return Consumer<TestProvider>(builder: (context, provider, child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question['question_text'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        SizedBox(height: 16.v),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.v),
                child: CustomRadioButton(
                  text: option,
                  value: option,
                  groupValue: provider.getRadioGroup(question['id'].toString()),
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  backgroundColor: Colors.transparent,
                  onChange: (value) {
                    provider.changeRadioButton1(question['id'].toString(), value);
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

  void onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  void onTapDone(BuildContext context) async {
    final provider = Provider.of<TestProvider>(context, listen: false);
    final answers = provider.getAnswers();

    List<Map<String, dynamic>> formattedAnswers = [];
    questions.forEach((question) {
      String selectedOption = answers[question['id'].toString()] ?? '';
      bool isCorrect = selectedOption == question['correct_answer'];
      formattedAnswers.add({
        'user_id': userId,
        'question_id': question['id'],
        'selected_option': selectedOption,
        'is_correct': isCorrect,
      });
    });

    print('answers $formattedAnswers');

    final response = await http.post(
      Uri.parse('${apiUrl}/api/v1/difftestresponses'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'responses': formattedAnswers}),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      final prefs = await SharedPreferences.getInstance();
      final body = json.decode(response.body);

      if (body['level'] != null) {
        final level = body['level'];

        // Navigate based on the level
        switch (level) {
          case 'beginner':
            NavigatorService.pushNamed(AppRoutes.techThirdTestResultScreen, arguments: body['prediction']);
            break;
          case 'intermediate':
            NavigatorService.pushNamed(AppRoutes.androidLargeEightScreen, arguments: body['prediction']);
            break;
          case 'advanced':
            NavigatorService.pushNamed(AppRoutes.androidLargeNineScreen, arguments: body['prediction']);
            break;
          default:
            print('Unknown level: $level');
            // Handle unexpected cases here if needed
            break;
        }

        // Save userTrack role in SharedPreferences
        if (body['prediction'] != null && body['prediction']['role'] != null) {
          final role = body['prediction']['role'];
          await prefs.setString('userTrack', role);
          print('role: $role');
        } else {
          print('Prediction data or role is missing');
        }
      } else {
        print('Level not found in response');
      }
    } else {
      print('Failed to save responses: ${response.body}');
    }
  }


}
