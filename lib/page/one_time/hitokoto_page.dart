import 'dart:async';

import 'package:pure_read/common/dao/httpdao.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'Widget/vertical_text.dart';
import 'model/one_say.dart';

class HitokotoPage extends StatefulWidget {
  @override
  HitokotoPageState createState() {
    // TODO: implement createState
    return HitokotoPageState();
  }
}

class HitokotoPageState extends State<HitokotoPage> {

  /// Wave 模糊方案
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildWaveBackground(
        config: CustomConfig(
      colors: [
        Colors.white70,
        Colors.white54,
        Colors.white30,
        Colors.white24,
      ],
      durations: [32000, 21000, 18000, 5000],
      heightPercentages: [0.25, 0.26, 0.28, 0.31],
      blur: _blurs[0],
    ));
  }

  /// 获取一言
  OneSay oneSay;
  // ignore: missing_return
  Future<OneSay> getOnesay() async {
    oneSay = await HttpDao.getHitokito();
    return oneSay;
  }

  /// 建立Wave Widget
  _buildWaveBackground(
      {Config config, Color backgroundColor = Colors.transparent}) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[600],
        child: FutureBuilder(
          future: getOnesay(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Stack(
                alignment: Alignment.bottomCenter,
                //未定位widget占满Stack整个空间
                // fit: StackFit.expand,
                children: <Widget>[
                  WaveWidget(
                    config: config,
                    backgroundColor: backgroundColor,
                    size: Size(MediaQuery.of(context).size.width, 400),
                    //waveAmplitude: 20,
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 170, 0),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: CustomPaint(
                          painter: VerticalText(
                        text: oneSay.hitokoto,
                        textStyle: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Qingcha',
                          color: Colors.black,
                          letterSpacing: 4,
                          wordSpacing: 4,
                          height: 1.9,
                        ),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                      )),
                    ),
                    top: 150,
                  ) ,
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                        child: Text(oneSay.hitokoto)
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "来源："+oneSay.from,
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Qingcha',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    top: 30,
                    left: 100,
                  ) ,
                ],
              );
            } else {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    WaveWidget(
                      config: config,
                      backgroundColor: backgroundColor,
                      size: Size(MediaQuery.of(context).size.width, 400),
                      //waveAmplitude: 20,
                    )
                  ]);
            }
          },
        ));
  }
}
