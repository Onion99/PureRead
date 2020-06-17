import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/common/net/address.dart';
import 'package:pure_read/page/one_time/model/model_bing/image.dart'
    as BingPhoto;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ProfileCardAlignment extends StatelessWidget {
  final BingPhoto.Image imageBing;
  ProfileCardAlignment(this.imageBing);

  VoidCallback openDialog(BuildContext context,String url) => () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            child: PhotoView(
              tightMode: true,
              imageProvider: NetworkImage(
                  url,
              ),
              heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
            ),
          ),
        );
      },
    );
  };

  @override
  Widget build(BuildContext context) {
    // 标清
//    String imageurl = Address.bingPhotoPng+imageBing.urlbase+Address.bingPhotoSize;
    // 高清
    String imageurl = Address.bingPhotoPng+imageBing.url;

    return GestureDetector(
      onTap: openDialog(context,imageurl),
      child: Card(
        elevation: 3.0,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Material(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  //预览图
                  fit: BoxFit.cover,
                  imageUrl: imageBing == null
                      ? HttpDao.loadingImage
                      : imageurl,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(
                        backgroundColor: Colors.pink,
                      ),
                  // width: 140.0,
                  // height: 88.0,
                ),
              ),
            ),
            SizedBox.expand(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter)),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(imageBing.copyright,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
