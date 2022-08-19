import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../enums/menu_action.dart';
import '../services/auth/auth_service.dart';
import '../utilities/dialogs/logout_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xffff9119),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(152, 181, 152, 0),
                child: Image.asset("assets/image/book.png"),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(99, 7, 99, 0),
                  child: Text(
                    '한동용어사전',
                    style: TextStyle(
                      fontFamily: 'PretendardVariable',
                      fontWeight: FontWeight.w800,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(41, 131, 40, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(searchRoute);
                  },
                  child: const MyWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(118, 37, 118, 0),
                child: SizedBox(
                  width: 139,
                  height: 35,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          '퀴즈 보러가기',
                          style: TextStyle(
                            color: Color(0xffff9199),
                            fontFamily: 'PretendardVariable',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Image.asset("assets/image/arrow.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
      bottomSheet: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0,
            color: const Color(0xffff9119),
          ),
          color: const Color(0xffff9119),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await AuthService.firebase().logOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                }
              },
              child: Container(
                height: 70,
                width: 90,
                child: Column(
                  children: const [
                    Icon(Icons.logout),
                    Text('로그아웃'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('검색어를 입력하세요'),
              Image.asset("assets/image/search.png"),
            ],
          ),
          const Divider(
            color: Colors.white,
            indent: 30,
            endIndent: 30,
          ),
        ],
      ),
    );
  }
}
