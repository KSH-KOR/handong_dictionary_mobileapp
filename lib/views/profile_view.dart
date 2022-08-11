import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sossu/services/auth/auth_service.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final user = AuthService.firebase().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: user!.profile.profileImage ??
                            const Icon(Icons.person),
                      ),
                    ),
                    Column(
                      children: [
                        Text(user!.profile.followerCount.toString()),
                        const Text('팔로워'),
                      ],
                    ),
                    Column(
                      children: [],
                    ),
                  ],
                ),
                Row(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
