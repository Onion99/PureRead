
import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/page/one_time/model/model_bing/image.dart' as BingImage;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'profile_card_alignment.dart';
import 'dart:math';

/// 卡片间间隔
List<Alignment> cardsAlign = [
  Alignment(0.0, 0.0),
  Alignment(0.3, -0.2),
  Alignment(0.6, -0.4)
];

/// 卡片间大小
List<Size> cardsSize = List(3);

class CardsSectionAlignment extends StatefulWidget {
  /// 卡片间大小初始化
  CardsSectionAlignment(BuildContext context) {
    cardsSize[0] = Size(MediaQuery.of(context).size.width * 0.90,
        MediaQuery.of(context).size.height * 0.80);
    cardsSize[1] = Size(MediaQuery.of(context).size.width * 0.90,
        MediaQuery.of(context).size.height * 0.80);
    cardsSize[2] = Size(MediaQuery.of(context).size.width * 0.90,
        MediaQuery.of(context).size.height * 0.80);
  }

  @override
  _CardsSectionState createState() => _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionAlignment>
    with SingleTickerProviderStateMixin {
  int cardsCounter = 0;

  /// 卡片Widget
  List<ProfileCardAlignment> cards = List();

  /// 动画控制器
  AnimationController _controller;

  Alignment frontCardAlign;
  double frontCardRot = 0.0;

  @override
  void initState() {
    super.initState();


    /// 动画控制
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _controller.addListener(() => setState(() {}));

    /// 状态监听
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) changeCardsOrder();
    });
  }


  List<BingImage.Image> listImage;
  Future<bool> getBingPhoto() async {
    listImage = await HttpDao.getBingPhoto();
    /// 初始化卡片
    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      cards.add(ProfileCardAlignment(listImage[cardsCounter]));
    }

    /// 最上面卡片
    frontCardAlign = cardsAlign[2];

    return true;
  }
  /// 改变卡片顺序
  void changeCardsOrder() {
    setState(() {
      // back card becomes the middle card; middle card becomes the front card, front card becomes a  bottom card)
      ProfileCardAlignment temp = cards[0];
      cards[0] = cards[1];
      cards[1] = cards[2];
      cards[2] = temp;

      cards[2] = ProfileCardAlignment(listImage[cardsCounter]);
      cardsCounter++;

      frontCardAlign = cardsAlign[2];
      frontCardRot = 0.0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  getBingPhoto(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.black12,offset: Offset(1,1),blurRadius: 1,spreadRadius: 1)
              ]
            ),
            child: Swiper(
                autoplay: false,
                pagination: new SwiperPagination(
                    margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                    builder: new DotSwiperPaginationBuilder(
                        color: Colors.white30,
                        activeColor: Colors.lightBlueAccent,
                        size: 10.0,
                        activeSize: 10.0)),
                scrollDirection: Axis.vertical,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height,
                itemBuilder: (context, index) {
                  return ProfileCardAlignment(listImage[index]);
                },
                itemCount: listImage.length),
          );
          /*return Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right:7.0),
                    child: Stack(
                      children: <Widget>[
                        /// 底层
                        backCard(),
                        /// 中层
                        middleCard(),
                        /// 上层
                        frontCard(),
                        /// Prevent swiping if the cards are animating
                        _controller.status != AnimationStatus.forward
                            ? SizedBox.expand(
                            child: GestureDetector(
                              // While dragging the first card
                              onPanUpdate: (DragUpdateDetails details) {
                                // Add what the user swiped in the last frame to the alignment of the card
                                setState(() {
                                  // 20 is the "speed" at which moves the card
                                  frontCardAlign = Alignment(
                                      frontCardAlign.x +
                                          10 *
                                              details.delta.dx /
                                              MediaQuery.of(context).size.width,
                                      frontCardAlign.y +
                                          20 *
                                              details.delta.dy /
                                              MediaQuery.of(context).size.height);

                                  frontCardRot = frontCardAlign.x; // * rotation speed;
                                });
                              },
                              // When releasing the first card
                              onPanEnd: (_) {
                                // If the front card was swiped far enough to count as swiped
                                if (frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0) {
                                  animateCards();
                                } else {
                                  // Return to the initial rotation and alignment
                                  setState(() {
                                    frontCardAlign = cardsAlign[2];
                                    frontCardRot = 0.0;
                                  });
                                }
                              },
                            ))
                            : Container(),
                      ],
                    ),
                  ),
                )
              ],
          );*/
        }
        else{
          return SpinKitFoldingCube(color: Colors.blue);
        }
      },

    );
  }



  /// 最下层卡片
  Widget backCard() {
    /// Align 组件可以调整子组件的位置，并且可以根据子组件的宽高来确定自身的的宽高
    return Align(
      /// 通过判断动画状态，来控制位置，动画未开始还是已完成
      /// 动画结束时位置
      /// alignment：表示子组件在父组件中的起始位置。
      alignment: _controller.status == AnimationStatus.forward
          ? CardsAnimation.backCardAlignmentAnim(_controller).value
          : cardsAlign[0],

      /// 动画开始时位置
      /// SizedBox，用于给子元素指定固定的宽高
      child: SizedBox.fromSize(
          size: _controller.status == AnimationStatus.forward
              ? CardsAnimation.backCardSizeAnim(_controller).value
              : cardsSize[2],
          child: cards[2]),
    );
  }

  /// 卡片
  Widget middleCard() {
    return Align(
      alignment: _controller.status == AnimationStatus.forward
          ? CardsAnimation.middleCardAlignmentAnim(_controller).value
          : cardsAlign[1],
      child: SizedBox.fromSize(
          size: _controller.status == AnimationStatus.forward
              ? CardsAnimation.middleCardSizeAnim(_controller).value
              : cardsSize[1],
          child: cards[1]),
    );
  }

  /// 最上层卡片控制
  Widget frontCard() {
    return Align(
        alignment: _controller.status == AnimationStatus.forward
            ? CardsAnimation.frontCardDisappearAlignmentAnim(
                    _controller, frontCardAlign)
                .value
            : frontCardAlign,
        child: Transform.rotate(
          angle: (pi / 180.0) * frontCardRot,
          child: SizedBox.fromSize(size: cardsSize[0], child: cards[0]),
        ));
  }

  void animateCards() {
    _controller.stop();
    _controller.value = 0.0;
    _controller.forward();
  }
}

/// 卡片动画
class CardsAnimation {
  /// Widget间动画，控制两个Widget之间的动画变换
  static Animation<Alignment> backCardAlignmentAnim(
      AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[0], end: cardsAlign[1]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Size> backCardSizeAnim(AnimationController parent) {
    return SizeTween(begin: cardsSize[2], end: cardsSize[1]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Alignment> middleCardAlignmentAnim(
      AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[1], end: cardsAlign[2]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Size> middleCardSizeAnim(AnimationController parent) {
    return SizeTween(begin: cardsSize[1], end: cardsSize[0]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Alignment> frontCardDisappearAlignmentAnim(
      AnimationController parent, Alignment beginAlign) {
    return AlignmentTween(
            begin: beginAlign,
            end: Alignment(
                beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0,
                0.0) // Has swiped to the left or right?
            )
        .animate(CurvedAnimation(
            parent: parent, curve: Interval(0.0, 0.5, curve: Curves.easeIn)));
  }
}
