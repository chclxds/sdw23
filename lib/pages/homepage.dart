import 'package:app_sdw23/models/users_models/users_models.dart';
import 'package:app_sdw23/services/api.dart';
import 'package:app_sdw23/shared/app_colors.dart';
import 'package:app_sdw23/shared/app_images.dart';
import 'package:app_sdw23/shared/app_settings.dart';
import 'package:app_sdw23/widgets/balance.dart';
import 'package:app_sdw23/widgets/card.dart';
import 'package:app_sdw23/widgets/features.dart';
import 'package:app_sdw23/widgets/header.dart';
import 'package:app_sdw23/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UsersModels? user;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    user = await ApiApp.fetchUser(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.whiteCustom,
              title: Center(
                child: SvgPicture.asset(
                  AppImages.logo,
                  height: 24,
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(
                    AppImages.notification,
                    height: 24,
                  ),
                )
              ],
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(user: user!),
                    const SizedBox(
                      height: 165,
                    ),
                    FeaturesWidget(features: user!.features!),
                    const SizedBox(
                      height: 10,
                    ),
                    CardWidget(card: user!.card!),
                    const SizedBox(
                      height: 10,
                    ),
                    InfoCardsWidget(news: user!.news!),
                  ],
                ),
                Positioned(
                  top: (AppSettings.screenHeight / 5) - 40,
                  child: BalanceWidget(account: user!.account!),
                )
              ],
            ),
          );
  }
}
