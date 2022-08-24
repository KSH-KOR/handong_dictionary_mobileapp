import 'package:flutter/material.dart';
import 'package:hdict/constants/routes.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';

import '../services/auth/auth_exceptions.dart';
import '../services/auth/auth_service.dart';
import '../utilities/my_snackbar.dart';
import '../utilities/dialogs/show_error_dialog.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.loginBackground,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(152, 181, 152, 0),
              child: Image.asset("assets/image/bookO.png"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(99, 7, 99, 0),
              child: Text(
                '한동용어사전',
                style: AppTextStyles.title1.copyWith(color: AppColors.primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(52, 155, 53, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(width: 0.1),
                ),
                elevation: 0.0,
                color: AppColors.loginBackground,
                child: InkWell(
                    onTap: () async {
                      try {
                        await AuthService.firebase().logIn();
                        final user = AuthService.firebase().currentUser;
                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            mySnackBar(
                              icon: Image.asset('assets/image/bi_person_circle.png'),
                              text: '${AuthService.firebase().userDisplayName()}님 안녕하세요',
                            ),
                          );
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            homeRoute,
                            (route) => false,
                          );
                        }
                      } on UserNotFoundAuthException {
                        await showErrorDialog(context, "User not found");
                      } on WrongPasswordAuthException {
                        await showErrorDialog(context, "Wrong password");
                      } on InvalidEmailAuthException {
                        await showErrorDialog(context, "Invalid email");
                      } on GenericAuthException {
                        await showErrorDialog(context, 'Authentication error');
                      } catch (e) {
                        await showErrorDialog(context,
                            "unknown error occured \nerror message: $e");
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(22, 12, 0, 13),
                            child: Image.asset("assets/image/google.png")),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(51, 15, 0, 17),
                            child: Text(
                              "구글 로그인",
                              style: AppTextStyles.body1.copyWith(color: const Color(0xFFB1AAA1)),
                            )),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
