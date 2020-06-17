import 'package:pure_read/common/net/address.dart';
import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/provider/provider_widget.dart';
import 'package:pure_read/provider/view_state_busy_widget.dart';
import 'package:pure_read/view_model/eyepetizerhotview_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'model/rank_entity.dart';

class EyepetizerHotView extends StatefulWidget {
  String url;

  EyepetizerHotView(this.url);

  @override
  State<StatefulWidget> createState() {
    return EyepetizerHotViewState(url);
  }
}

class EyepetizerHotViewState extends State<EyepetizerHotView> {
  List<ItemList> itemList;
  String rankUrl;

  EyepetizerHotViewState(this.rankUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProviderWidget<EyepetizerHotViewModel>(
      model: EyepetizerHotViewModel(),
      onModelReady: (model) {
        model.rankUrl = rankUrl;
        model.initData();
      },
      builder: (context, model, child) {
        if (model.isBusy) {
          return SpinKitFoldingCube(color: Colors.blue);
        } else if (model.isError) {
          return ViewStateErrorWidget(
              error: model.viewStateError, onPressed: model.initData);
        } else if (model.isEmpty) {
          return ViewStateEmptyWidget(onPressed: model.initData);
        }
        itemList = model.list;
        return EasyRefresh(
          header: BezierCircleHeader(),
          enableControlFinishRefresh: true,
          onRefresh: () {
            model.refresh();
          },
          child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int position) {
                return Card(
                  margin: EdgeInsets.all(23),
                  elevation: 13.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(23.0))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                    child: InkWell(
                      onTap: () {
                        NavigatorUtil.pushWeb(context,
                            title: itemList[position].data?.title,
                            url: itemList[position]
                                .data
                                .webUrl
                                .raw
                                .replaceAll("http", "https"));
                      },
                      borderRadius: BorderRadius.circular(23),
                      splashColor: Colors.transparent,
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: itemList[position].data.cover.feed,
                            fit: BoxFit.cover,
                            height: 270.0,
                          ),
                          Container(
                            color: Color(0x55000000),
                            height: 270.0,
                          ),
                          Positioned(
                            top: 1.0,
                            bottom: 1.0,
                            left: 1.0,
                            right: 1.0,
                            child: Center(
                              child: Text(
                                itemList[position].data?.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontFamily: 'LanTing-Bold',
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 1.0,
                            right: 1.0,
                            bottom: 100.0,
                            child: Center(
                              child: Text(
                                '#' +
                                    itemList[position].data?.category +
                                    " / " +
                                    Address.durationFormat(
                                        itemList[position].data.duration),
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontFamily: 'LanTing',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
