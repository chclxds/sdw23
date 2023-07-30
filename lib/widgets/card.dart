import 'package:app_sdw23/models/users_models/card.dart';
import 'package:app_sdw23/shared/app_colors.dart';
import 'package:app_sdw23/shared/app_images.dart';
import 'package:app_sdw23/shared/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final CC card;
  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      width: AppSettings.screenWidth - 24,
      decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cartão Final: ${card.number!.split(' ')[3]}",
            style: TextStyle(
                color: AppColors.whiteCustom,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          SvgPicture.asset(
            AppImages.down,
            semanticsLabel: '',
            height: 14,
          )
        ],
      ),
    );
  }
}
