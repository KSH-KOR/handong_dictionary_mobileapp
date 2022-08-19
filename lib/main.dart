import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdict/constants/routes.dart';
import 'package:hdict/firebase_options.dart';
import 'package:hdict/services/search_view_provider.dart';
import 'package:hdict/views/home_page.dart';
import 'package:hdict/views/init_view.dart';
import 'package:provider/provider.dart';

import 'views/login_view.dart';
import 'views/test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SearchViewProvider(),
      ),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitView(),
      routes: {
        homeRoute: (context) => const HomePage(),
        loginRoute: (context) => const LoginView(),
        searchRoute: (context) => const WordList(),
      },
    ),
  ));
}
