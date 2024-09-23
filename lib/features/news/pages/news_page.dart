import 'package:flutter/material.dart';

import '../../../core/models/news_model.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: 'NEWS'),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            children: [
              const SizedBox(height: 13),
              ...List.generate(
                newsList.length,
                (index) {
                  return NewsCard(news: newsList[index]);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: navBarHeight),
      ],
    );
  }
}
