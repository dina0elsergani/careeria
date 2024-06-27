import 'package:careeria/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/tech_test_result_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:careeria/core/app_export.dart';

class TechTestResultScreen extends StatefulWidget {
  const TechTestResultScreen({Key? key}) : super(key: key);

  @override
  TechTestResultScreenState createState() => TechTestResultScreenState();

  // Define a static builder method
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TechTestResultProvider(),
      child: TechTestResultScreen(),
    );
  }
}

class TechTestResultScreenState extends State<TechTestResultScreen> {
  String userTrack = "loading..."; // Initial text

  @override
  void initState() {
    super.initState();
    _loadUserTrack();
  }

  _loadUserTrack() async {
    final prefs = await SharedPreferences.getInstance();
    String track = prefs.getString('userTrack') ?? "Unknown"; 
    print("Loaded userTrack: $track");
    setState(() {
      userTrack = track;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.teal100,
        body: Container(
          width: 300.h,
          padding: EdgeInsets.symmetric(vertical: 20.v),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 150.v),
              CustomImageView(
                imagePath: ImageConstant.imgPrizeCupForThe,
                height: 262.v,
                width: 300.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.h, right: 0.h),
                child: Text(
                  "The right track for you is $userTrack",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineSmallWhiteA700Regular,
                ),
              ),
              SizedBox(height: 20.v),
              Center(
                child: CustomElevatedButton(
                        height: 44.v,
                        width: 120.v,
                        text: "continue",
                        margin: EdgeInsets.only(left: 14.h),
                        buttonTextStyle: Theme.of(context).textTheme.titleLarge!,
                        onPressed: () {
                          _navigateToNextScreen(context);
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.testScreen);
  }
}
