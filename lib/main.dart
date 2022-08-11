import 'package:flutter/material.dart';
import 'package:sossu/constants/routes.dart';
import 'package:sossu/enums/category.dart';
import 'package:sossu/views/category_select_view.dart';
import 'package:sossu/views/homepage_view.dart';
import 'package:sossu/views/init_view.dart';
import 'package:sossu/views/login_view.dart';
import 'package:sossu/views/register_view.dart';
import 'package:sossu/views/rooms/new_room_view.dart';
import 'package:sossu/views/rooms/room_list_view.dart';
import 'package:sossu/views/verifyemail_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const RoomListView(),
    routes: {
        loginRoute:(context) => const LoginView(),
        registerRoute:(context) => const RegisterView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        homepageRoute: (context) => const HomePage(),
        categorySelectRoute: (context) => const CategorySelectView(),
      },
  ));
}
