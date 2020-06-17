
import 'package:pure_read/page/aggregationnews/page/page_guoke.dart';
import 'package:pure_read/page/aggregationnews/page/page_readhub.dart';
import 'package:pure_read/page/aggregationnews/page/page_zhihu.dart';
import 'package:pure_read/page/aggregationnews/theme/aggregation_theme.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AggregationNews extends StatefulWidget {
  @override
  AggergationNewPageState createState() {
    return AggergationNewPageState();
  }
}

class AggergationNewPageState extends State<AggregationNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getCategoryUI(),
            Expanded(child: modelChoice(categoryType.toString()))
          ],
        ),
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            '精选聚合',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AggregationTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(
                  CategoryType.zhihu, categoryType == CategoryType.zhihu),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.guoke, categoryType == CategoryType.guoke),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.readhub, categoryType == CategoryType.readhub),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  CategoryType categoryType = CategoryType.zhihu;
  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String categoryName = '';
    if (CategoryType.zhihu == categoryTypeData) {
      categoryName = '知乎日报';
    } else if (CategoryType.guoke == categoryTypeData) {
      categoryName = '果壳趣事';
    } else if (CategoryType.readhub == categoryTypeData) {
      categoryName = 'ReadHub';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? AggregationTheme.nearlyBlue
                : AggregationTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: AggregationTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  categoryName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AggregationTheme.nearlyWhite
                        : AggregationTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget modelChoice(String category) {
    print(category);
    switch (category) {
      case "CategoryType.zhihu":
        return ZhihuPage();
        break;
      case "CategoryType.guoke":
        return GuokePage();
        break;
      case "CategoryType.readhub":
        return ReadhubPage();
        break;
    }
  }
}

enum CategoryType {
  zhihu,
  guoke,
  readhub
}
