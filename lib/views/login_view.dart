import 'package:flutter/material.dart';
import 'package:sossu/constants/routes.dart';
import 'package:sossu/services/auth/auth_exceptions.dart';
import 'package:sossu/services/auth/auth_service.dart';
import 'package:sossu/utilities/show_error_dialog.dart';
import 'package:sossu/utilities/helper_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late bool _obscureText;

  @override
  void initState() {
    //automatically called when homepage is created
    _email = TextEditingController();
    _password = TextEditingController();
    _obscureText = true;
    super.initState();
  }

  @override
  void dispose() {
    //automatically called when homepage is disposed
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 275,
                  child: TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(),
                      labelText: '이메일',
                      hintText: '이메일을 입력하세요',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 211, 211, 211),
                      filled: true,
                    ),
                  ),
                ),
                addVerticalSpace(30),
                SizedBox(
                  width: 275,
                  child: TextField(
                    controller: _password,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(),
                      labelText: '비밀번호',
                      hintText: '비밀번호를 입력하세요',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5),
                        ),
                      ),
                      fillColor: Color.fromARGB(255, 211, 211, 211),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextButton(
                    onPressed: _toggle,
                    child: Text(_obscureText ? "Show" : "Hide")),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await AuthService.firebase()
                          .logIn(email: email, password: password);
                      final user = AuthService.firebase().currentUser;
                      if (user?.isEmailVerified ?? false) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          categorySelectRoute,
                          (route) => false,
                        );
                      } else {
                        await AuthService.firebase().sendEmailVerification();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          verifyEmailRoute,
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
                      await showErrorDialog(
                          context, "unknown error occured \nerror message: $e");
                    }
                  },
                  child: const Text('로그인'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute, (route) => false);
                  },
                  child: const Text('회원가입'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
