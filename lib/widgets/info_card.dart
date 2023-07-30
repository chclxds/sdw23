import 'package:app_sdw23/models/users_models/news.dart';
import 'package:app_sdw23/shared/app_colors.dart';
import 'package:app_sdw23/shared/app_images.dart';
import 'package:app_sdw23/shared/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCardsWidget extends StatefulWidget {
  final List<News> news;
  const InfoCardsWidget({super.key, required this.news});

  @override
  State<InfoCardsWidget> createState() => _InfoCardsWidgetState();
}

class _InfoCardsWidgetState extends State<InfoCardsWidget> {
  PageController pageController = PageController();
  int cardPosition = 0;
  var icons = <Widget>[];

  @override
  void initState() {
    super.initState();
    buildIcons();
  }

  buildIcons() {
    icons.clear();
    for (var i = 0; i < widget.news.length; i++) {
      icons.add(Container(
        margin: const EdgeInsets.all(4),
        child: SvgPicture.asset(
          cardPosition == i ? AppImages.circleOn : AppImages.circleOff,
          height: 14,
        ),
      ));
    }
  }

  Widget getFeaturesCard(String image, String description) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteCustom,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 36,
            ),
            SvgPicture.network(
              image,
              semanticsLabel: '',
              colorFilter: ColorFilter.mode(AppColors.red, BlendMode.srcIn),
              width: 48,
              height: 48,
            ),
            const SizedBox(
              width: 36,
            ),
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayDark),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: AppSettings.screenWidth,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                cardPosition = index;
                buildIcons();
              });
            },
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: widget.news
                .map((e) => getFeaturesCard(e.icon!, e.description!))
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons,
        )
      ],
    );
  }
}
