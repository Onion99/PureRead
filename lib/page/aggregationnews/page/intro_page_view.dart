
import 'package:pure_read/page/aggregationnews/anima/page_transformer.dart';
import 'package:pure_read/page/aggregationnews/model/zhihuday_detail.dart';
import 'package:pure_read/page/aggregationnews/widget/intro_page_item.dart';
import 'package:flutter/material.dart';

class IntroPageView extends StatelessWidget {
  List<ZhihuDayDetail> newsDay;
  IntroPageView({this.newsDay});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: newsDay.length,
                itemBuilder: (context, index) {
                  final item = newsDay[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}