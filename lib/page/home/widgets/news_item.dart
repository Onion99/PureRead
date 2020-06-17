import 'package:pure_read/model/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  NewsViewModel newsViewModel;
  VoidCallback onPressed;

  NewsItem(this.newsViewModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      top: false,
      bottom: false,
      child: Card(
        elevation: 1.5,
        margin: EdgeInsets.fromLTRB(6, 12, 6, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: InkWell(
          // Make it splash on Android. It would happen automatically if this
          // was a real card but this is just a demo. Skip the splash on iOS.
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    //预览图
                    fit: BoxFit.fitWidth,
                    imageUrl: newsViewModel.image,
                    placeholder: (context, url) => CircularProgressIndicator(
                      backgroundColor: Colors.pink,
                    ),
                    width: 140.0,
                    height: 88.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        newsViewModel.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        newsViewModel.passtime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsViewModel {
  String path;
  String image;
  String title;
  String passtime;

  NewsViewModel({this.path, this.image, this.title, this.passtime});

  ///使用命名构造函数可为一个类实现多个构造函数， 也可以使用命名构造函数来更清晰的表明函数意图
  NewsViewModel.fromMap(News news) {
    path = news.path;
    image = news.image;
    title = news.title;
    passtime = news.passtime;
  }
}
