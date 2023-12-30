import 'package:get/get.dart';
import 'package:online_video_player/view/screens/home/home_screen.dart';
import 'package:online_video_player/view/screens/video_play/online_video_play.dart';

class AppRoute {
  static const String homeScreen = "/home_screen";
  static const String onlineVideoPlay = "/video_play";

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: onlineVideoPlay, page: () => const OnlineVideoPlay()),
  ];
}