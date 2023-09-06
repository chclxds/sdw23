import 'package:app_sdw23/models/users_models/account.dart';
import 'package:app_sdw23/shared/app_colors.dart';
import 'package:app_sdw23/shared/app_images.dart';
import 'package:app_sdw23/shared/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class BalanceWidget extends StatelessWidget {
  final Account account;
  const BalanceWidget({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: AppSettings.screenWidth,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
              color: AppColors.whiteCustom,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppImages.moneyCircle,
                    semanticsLabel: '',
                    colorFilter:
                        ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    height: 25,
                  ),
                  Text(
                    "Saldo Disponível",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SvgPicture.asset(
                    AppImages.up,
                    semanticsLabel: '',
                    colorFilter:
                        ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                    height: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ ${NumberFormat('#,###.00', 'pt_BR').format(account.balance! + account.limit!)}",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saldo + Limite: R\$ ${NumberFormat('#,###.00', 'pt-BR').format(account.balance! + account.limit!)}",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                height: 2,
                color: AppColors.grayLight,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ver Extrato",
                    style: TextStyle(
                        color: AppColors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
