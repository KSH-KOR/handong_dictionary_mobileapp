import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/utilities/helper_widgets.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(bottom: 10),
          titlePadding: const EdgeInsets.fromLTRB(24, 45, 24, 0),
          insetPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          title: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '접속중인 기기에서 로그아웃 하시겠습니까?',
                      style: AppTextStyles.body6,
                    ),
                  ),
          content: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
            child: SizedBox(
              height: 80,
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          '취소',
                          style: AppTextStyles.body6
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            '로그아웃',
                            style: AppTextStyles.body6
                                .copyWith(color: AppColors.primaryColor),
                          )),
                      addHorizontalSpace(20),
                    ],
                  )
                
            ),
          ),
        );
      }).then((value) => value ?? false);
}
