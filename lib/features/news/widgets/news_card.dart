import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news_model.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../pages/news_detail_sheet.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: news.image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              errorWidget: (context, url, error) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.main,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.black50,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  TextM(news.title, fontSize: 20),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: TextR(
                          news.content,
                          fontSize: 16,
                          color: const Color(0xffAEAEAE),
                        ),
                      ),
                      const SizedBox(width: 40),
                      CupertinoButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppColors.black75,
                            useSafeArea: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            builder: (context) {
                              return NewsDetailSheet(news: news);
                            },
                          );
                        },
                        padding: EdgeInsets.zero,
                        minSize: 30,
                        child: Opacity(
                          opacity: 0.75,
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.white50,
                              ),
                            ),
                            child: const Center(
                              child: TextM('Open', fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
