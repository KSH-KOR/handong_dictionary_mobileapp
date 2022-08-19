import 'package:flutter/material.dart';
import 'package:hdict/services/auth/auth_service.dart';
import 'package:hdict/views/home_page.dart';
import 'package:hdict/views/login_view.dart';

class InitView extends StatelessWidget {
  const InitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if(user == null) {
                return const LoginView();
              } else {
                return const HomePage();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      );
  }
}
