import 'package:flutter/material.dart';
import 'package:sossu/services/auth/auth_service.dart';
import 'package:sossu/views/category_select_view.dart';
import 'package:sossu/views/homepage_view.dart';
import 'package:sossu/views/login_view.dart';
import 'package:sossu/views/verifyemail_view.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              if(user == null) return const LoginView();
              if (user.isEmailVerified) {
                return const CategorySelectView();
              } else {
                return const VerifyEmailView();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      );
  }
}
