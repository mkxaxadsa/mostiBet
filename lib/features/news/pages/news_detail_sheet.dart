import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news_model.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsDetailSheet extends StatelessWidget {
  const NewsDetailSheet({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: CachedNetworkImage(
                  imageUrl: news.image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff000000).withOpacity(0),
                      const Color(0xff163B4B),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Text(
                    news.title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontFamily: Fonts.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 5,
                child: CupertinoButton(
                  onPressed: () {
                    context.pop();
                  },
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset('assets/close.svg'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 15,
                ),
                child: TextM(
                  news.content,
                  fontSize: 20,
                  maxLines: 200,
                ),
              ),
              SizedBox(height: getBottom(context)),
            ],
          ),
        ),
      ],
    );
  }
}
