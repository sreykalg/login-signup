import 'package:get/get.dart';
import 'package:login_signup/login_page.dart';
import 'package:login_signup/signup_page.dart';

class RoutesName{
  static const String initial = '/';
  static const String signup = '/sign-up';

  static const getInitial = LoginPage();
  static const getSignup = SignupPage();

  static List<GetPage> routes = [
    GetPage(name: initial, page :() => LoginPage(),),
    GetPage(name: signup, page :() => SignupPage(),),
  ];

}