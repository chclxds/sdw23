import 'package:app_sdw23/models/users_models/users_models.dart';
import 'package:app_sdw23/shared/app_colors.dart';
import 'package:app_sdw23/shared/app_settings.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final UsersModels user;
  const HeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      height: AppSettings.screenHeight / 5,
      width: AppSettings.screenWidth,
      color: AppColors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Olá, ${user.name}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteCustom),
          ),
          Text(
            "Ag: ${user.account!.agency!} Cc: ${user.account!.number!}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteCustom),
          ),
        ],
      ),
    );
  }
}
