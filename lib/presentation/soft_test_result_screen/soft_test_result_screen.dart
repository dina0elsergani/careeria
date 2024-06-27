import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:careeria/core/app_export.dart';
import 'package:careeria/widgets/custom_elevated_button.dart';

class SoftTestResultScreen extends StatefulWidget {
  const SoftTestResultScreen({Key? key}) : super(key: key);

  @override
  SoftTestResultScreenState createState() => SoftTestResultScreenState();

  // Define a static builder method
  static Widget builder(BuildContext context) {
    return SoftTestResultScreen();
  }
}

class SoftTestResultScreenState extends State<SoftTestResultScreen> {
  List<String> weaknesses = []; // List to store weaknesses
  bool loading = true; // Loading indicator

  @override
  void initState() {
    super.initState();
    loadWeaknesses();
  }

  Future<void> loadWeaknesses() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      weaknesses = prefs.getStringList('weaknesses') ?? [];
      print('Weaknesses loaded: $weaknesses');
    } catch (error) {
      print('Failed to load weaknesses: $error');
      // Handle error appropriately in your UI
    } finally {
      setState(() {
        loading = false; // Set loading to false when done loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.teal100,
        body: Center(
          child: Container(
            width: 300.h,
            padding: EdgeInsets.symmetric(vertical: 20.v),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgBusinessCoachExplains,
                  height: 262.v,
                  width: 400.h,
                ),
                SizedBox(height: 20.v),
                loading
                    ? _buildLoadingWidget()
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: weaknesses.length,
                          itemBuilder: (context, index) {
                            return _buildWeaknessItem(index);
                          },
                        ),
                      ),
                SizedBox(height: 20.v),
                CustomElevatedButton(
                  height: 44.v,
                  width: 120.v,
                  text: "Continue",
                  margin: EdgeInsets.only(left: 14.h),
                  buttonTextStyle: Theme.of(context).textTheme.titleLarge!,
                  onPressed: () {
                    _navigateToNextScreen(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(), // Replace with your loading widget
    );
  }

  Widget _buildWeaknessItem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 8.v),
      child: Text(
        '${index + 1}- ${weaknesses[index]}',
        style: CustomTextStyles.headlineSmallWhiteA700Regular,
        textAlign: TextAlign.center,
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.androidLargeTwentythreeContainerScreen);
  }
}
