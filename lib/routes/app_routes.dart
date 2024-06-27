import 'package:flutter/material.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/app_introduction1_screen/app_introduction1_screen.dart';
import '../presentation/introduction_2_screen/introduction_2_screen.dart';
import '../presentation/app_3_screen/app_3_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/avatar_screen/avatar_screen.dart';
import '../presentation/tech_soft_selection_screen/tech_soft_selection_screen.dart';
import '../presentation/soft_test_screen/soft_test_screen.dart';
import '../presentation/technical_test_screen/technical_test_screen.dart';
import '../presentation/tech_third_test_result_screen/tech_third_test_result_screen.dart';
import '../presentation/android_large_eight_screen/android_large_eight_screen.dart';
import '../presentation/android_large_nine_screen/android_large_nine_screen.dart';
import '../presentation/course_view_screen/course_view_screen.dart';
import '../presentation/course_videos_screen/course_videos_screen.dart';
import '../presentation/android_large_twentythree_container_screen/android_large_twentythree_container_screen.dart';
import '../presentation/student_profile_screen/student_profile_screen.dart';
import '../presentation/edit_profile_screen/edit_profile_screen.dart';
import '../presentation/test_screen/test_screen.dart';
import '../presentation/soft_test_result_screen/soft_test_result_screen.dart';
import '../presentation/tech_test_result_screen/tech_test_result_screen.dart';
import '../presentation/frame_eightyone_screen/frame_eightyone_screen.dart';
import '../presentation/frame_eightytwo_screen/frame_eightytwo_screen.dart';
import '../presentation/course_test_success_screen/course_test_success_screen.dart';
import '../presentation/course_test_failure_screen/course_test_failure_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String signupScreen = '/signup_screen';

  static const String splashScreen = '/splash_screen';

  static const String appIntroduction1Screen = '/app_introduction1_screen';

  static const String introduction2Screen = '/introduction_2_screen';

  static const String app3Screen = '/app_3_screen';

  static const String loginScreen = '/login_screen';

  static const String avatarScreen = '/avatar_screen';

  static const String techSoftSelectionScreen = '/tech_soft_selection_screen';

  static const String softTestScreen = '/soft_test_screen';

  static const String technicalTestScreen = '/technical_test_screen';

  static const String techThirdTestResultScreen =
      '/tech_third_test_result_screen';

  static const String androidLargeEightScreen = '/android_large_eight_screen';

  static const String androidLargeNineScreen = '/android_large_nine_screen';

  static const String studentCoursesScreenPage = '/student_courses_screen_page';

  static const String courseViewScreen = '/course_view_screen';

  static const String courseVideosScreen = '/course_videos_screen';

  static const String studentHomeScreenPage = '/student_home_screen_page';

  static const String androidLargeTwentythreeContainerScreen =
      '/android_large_twentythree_container_screen';

  static const String settingsScreenPage = '/settings_screen_page';

  static const String studentProfileScreen = '/student_profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String favouriteCoursesScreenPage =
      '/favourite_courses_screen_page';

  static const String testScreen = '/test_screen';

  static const String softTestResultScreen = '/soft_test_result_screen';

  static const String techTestResultScreen = '/tech_test_result_screen';

  static const String frameEightyoneScreen = '/frame_eightyone_screen';

  static const String frameEightytwoScreen = '/frame_eightytwo_screen';

  static const String courseTestSuccessScreen = '/course_test_success_screen';

  static const String courseTestFailureScreen = '/course_test_failure_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        signupScreen: SignupScreen.builder,
        splashScreen: SplashScreen.builder,
        appIntroduction1Screen: AppIntroduction1Screen.builder,
        introduction2Screen: Introduction2Screen.builder,
        app3Screen: App3Screen.builder,
        loginScreen: LoginScreen.builder,
        avatarScreen: AvatarScreen.builder,
        techSoftSelectionScreen: TechSoftSelectionScreen.builder,
        softTestScreen: SoftTestScreen.builder,
        technicalTestScreen: TechnicalTestScreen.builder,
        techThirdTestResultScreen: TechThirdTestResultScreen.builder,
        androidLargeEightScreen: AndroidLargeEightScreen.builder,
        androidLargeNineScreen: AndroidLargeNineScreen.builder,
        courseViewScreen: CourseViewScreen.builder,
        androidLargeTwentythreeContainerScreen:
            AndroidLargeTwentythreeContainerScreen.builder,
        studentProfileScreen: StudentProfileScreen.builder,
        editProfileScreen: EditProfileScreen.builder,
        testScreen: TestScreen.builder,
        softTestResultScreen: SoftTestResultScreen.builder,
        techTestResultScreen: TechTestResultScreen.builder,
        frameEightyoneScreen: FrameEightyoneScreen.builder,
        frameEightytwoScreen: FrameEightytwoScreen.builder,
        courseTestSuccessScreen: CourseTestSuccessScreen.builder,
        courseTestFailureScreen: CourseTestFailureScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
