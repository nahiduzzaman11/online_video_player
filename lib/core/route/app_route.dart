import 'package:get/get.dart';
import 'package:online_video_player/view/screens/home/home_screen.dart';

class AppRoute {
  static const String homeScreen = "/home_screen";
  static const String videoPlay = "/video_play";

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}