
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hdict/constants/routes.dart';
import 'package:hdict/firebase_options.dart';
import 'package:hdict/services/quiz_page_provider.dart';
import 'package:hdict/services/quiz_select_provider.dart';
import 'package:hdict/services/search_view_provider.dart';
import 'package:hdict/views/dev/dev_mode_view.dart';
import 'package:hdict/views/dictionary/card_view.dart';
import 'package:hdict/views/home_page.dart';
import 'package:hdict/views/init_view.dart';
import 'package:hdict/views/quiz/quiz_play_view.dart';
import 'package:hdict/views/quiz/quiz_result_view.dart';
import 'package:provider/provider.dart';

import 'services/textfield_provider.dart';
import 'views/dictionary/add_request_page.dart';
import 'views/dictionary/revise_request_page.dart';
import 'views/login_view.dart';
import 'views/quiz/quiz_start_view.dart';
import 'views/search_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SearchViewProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => TextFieldProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => QuizPageProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => QuizSelectProvider(),
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
        searchRoute: (context) => const SearchView(),
        addRequestRoute: (context) => const AddRequestView(),
        reviseRequestRoute: (context) => const ReviseRequestView(),
        dictionaryCardRoute: (context) => const DictionaryCardView(),
        devSearchRoute:(context) => const DevSearchView(),
        quizPlayRoute:(context) => const QuizPlayView(),
        quizStartRoute:(context) => const QuizStartView(),
        quizResultRoute:(context) => const QuizResultView(),
      },
    ),
  ));
}
