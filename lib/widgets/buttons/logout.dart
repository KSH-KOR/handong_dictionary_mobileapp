import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../services/auth/auth_service.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_theme.dart';
import '../../utilities/dialogs/logout_dialog.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final shouldLogout = await showLogOutDialog(context);
          if (shouldLogout) {
            await AuthService.firebase().logOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(loginRoute, (_) => false);
          }
        },
        child: Container(
          width: 45,
          height: 41,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0,
              color: const Color(0xffff9119),
            ),
            color: const Color(0xffff9119),
          ),
          child: FittedBox(
            child: Column(
              children: [
                Icon(
                  Icons.logout,
                  color: AppColors.whiteColor.withAlpha(204),
                ),
                Text(
                  '로그아웃',
                  style: AppTextStyles.body3
                      .copyWith(color: AppColors.whiteColor.withAlpha(204)),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
