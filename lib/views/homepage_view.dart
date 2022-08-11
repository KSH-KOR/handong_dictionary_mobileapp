import 'package:flutter/material.dart';
import 'package:sossu/enums/menu_action.dart';
import 'package:sossu/utilities/dialogs.dart';
import '../../services/auth/auth_service.dart';

import 'package:sossu/constants/routes.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get userEmail => AuthService.firebase()
      .currentUser!
      .email!; //we can assume every user has email at this point2


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your notes"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
              },
            ), 
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                    }
                    break;
                }
              },
              itemBuilder: (contest) {
                return const [
                  PopupMenuItem<MenuAction>(
                      value: MenuAction.logout, child: Text("Log out"))
                ];
              },
            ), 
          ],
        ),
      body: const Center(child: Text('Home Page')),
        
      );
  }
}
