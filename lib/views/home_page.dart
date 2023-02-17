import 'package:flutter/material.dart';
import 'package:hdict/services/cloud/firebase_cloud_quizbook_storage.dart';
import 'package:hdict/services/quiz_page_provider.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:provider/provider.dart';
import '../constants/routes.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons/logout.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(152, 181, 152, 0),
              child: SvgPicture.asset("assets/image/book.svg"),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(99, 7, 99, 0),
                child: Text(
                  '한동용어사전',
                  style: AppTextStyles.title1
                      .copyWith(color: AppColors.whiteColor),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(41, 131, 40, 0),
              child: GestureDetector(
                onLongPress: () {
                  Navigator.of(context).pushNamed(devSearchRoute);
                },
                onTap: () {
                  Navigator.of(context).pushNamed(
                    searchRoute,
                    arguments: true,
                  );
                },
                child: const SearchBar(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(118, 56, 118, 0),
              child: SizedBox(
                width: 112,
                height: 43,
                child: OutlinedButton(
                  onPressed: () {
                    if (Provider.of<QuizPageProvider>(context, listen: false)
                        .isStarted) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          quizPlayRoute, (route) => false);
                    } else {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          quizStartRoute, (route) => false);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: const BorderSide(
                        width: 0, color: AppColors.primaryColor),
                  ),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text('용어 퀴즈',
                            style: AppTextStyles.body3
                                .copyWith(color: AppColors.primaryColor)),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child:
                              SvgPicture.asset("assets/image/right_arrow.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.fromLTRB(298, 260, 0, 0),
            //   child: LogOutButton(),
            // ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      child: Column(
        children: [
          Row(
            children: [
              addHorizontalSpace(10),
              Text(
                '검색어를 입력하세요',
                style: AppTextStyles.body2
                    .copyWith(color: AppColors.whiteColor.withAlpha(178)),
              ),
              addHorizontalSpace(125),
              SvgPicture.asset("assets/image/search.svg"),
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
