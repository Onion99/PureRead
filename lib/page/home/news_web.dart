import 'package:pure_read/common/dao/note.dart';
import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewWeb extends StatefulWidget {
  const NewWeb({Key key, this.title, this.id, this.url}) : super(key: key);

  final String title;
  final String id;
  final String url;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsWebState();
  }
}

class NewsWebState extends State<NewWeb>{
  bool hasCollect = false;

  void _onPopSelected(String value) {
    String _title = widget.title ?? "新闻详情";
    switch (value) {
      case "browser":
        NavigatorUtil.launchInBrowser(widget.url, title: _title);
        break;
      case "collection":
        break;
      case "share":
        String _url = widget.url;
        Share.share('$_title : $_url');
        break;
      default:
        break;
    }
  }

  Note page;
  @override
  void initState() {
    checkPageHasCollect();
  }

  Future<void> checkPageHasCollect() async {
    page = await NoteProvider.getWebPageByTime( widget.url);
    if(page != null){
      hasCollect = true;
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        elevation: 3,
        brightness: Brightness.light,
        backgroundColor: AppTheme.nearlyWhite,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        title:  Text(
          widget.title ?? "新闻详情",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppTheme.darkText,
            fontFamily: "LanTing",
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: "收藏",
            icon: Hero(
              tag: "collect",
              child: Icon(
                  hasCollect == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.redAccent[100]),
            ),
            onPressed: ()  {
              if(hasCollect){
                NoteProvider.deleteWebPage(page.id);
                hasCollect = false;
              }
              else{
                NoteProvider.insertWebPage(Note(time: DateTime.now().toIso8601String(),title: widget.title,content: widget.url,));
                checkPageHasCollect();
              }
              setState(() {});
            },
          ),
          new PopupMenuButton(
              icon: Icon(Icons.menu,color: AppTheme.darkText),
              padding: const EdgeInsets.all(0.0),
              onSelected: _onPopSelected,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                 PopupMenuItem<String>(
                    value: "browser",
                    child: ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        dense: false,
                        title: new Container(
                          alignment: Alignment.center,
                          child: new Row(
                            children: <Widget>[
                              Icon(
                                Icons.language,
                                color: AppTheme.darkText,
                                size: 22.0,
                              ),
                              Text(
                                '浏览器打开',
                                style: TextStyle(
                                  color: AppTheme.darkText,
                                  fontFamily: "LanTing",
                                ),
                              )
                            ],
                          ),
                        ))),
                 PopupMenuItem<String>(
                    value: "share",
                    child: ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        dense: false,
                        title: new Container(
                          alignment: Alignment.center,
                          child: new Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              Text(
                                '分享',
                                style: TextStyle(
                                  color: AppTheme.darkText,
                                  fontFamily: "LanTing",
                                ),
                              )
                            ],
                          ),
                        ))),
              ])
        ],
      ),
      body:  WebView(
        onWebViewCreated: (WebViewController webViewController) {
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}