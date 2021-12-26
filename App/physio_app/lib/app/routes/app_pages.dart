import 'package:get/get.dart';

import 'package:physio_app/app/modules/change_profile/bindings/change_profile_binding.dart';
import 'package:physio_app/app/modules/change_profile/views/change_profile_view.dart';
import 'package:physio_app/app/modules/chat_room/bindings/chat_room_binding.dart';
import 'package:physio_app/app/modules/chat_room/views/chat_room_view.dart';
import 'package:physio_app/app/modules/home/bindings/home_binding.dart';
import 'package:physio_app/app/modules/home/views/home_view.dart';
import 'package:physio_app/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:physio_app/app/modules/introduction/views/introduction_view.dart';
import 'package:physio_app/app/modules/login/bindings/login_binding.dart';
import 'package:physio_app/app/modules/login/views/login_view.dart';
import 'package:physio_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:physio_app/app/modules/profile/views/profile_view.dart';
import 'package:physio_app/app/modules/register/bindings/register_binding.dart';
import 'package:physio_app/app/modules/register/views/register_view.dart';
import 'package:physio_app/app/modules/search/bindings/search_binding.dart';
import 'package:physio_app/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PROFILE,
      page: () => ChangeProfileView(),
      binding: ChangeProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
