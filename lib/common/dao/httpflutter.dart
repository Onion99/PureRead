import 'dart:convert';

import 'package:pure_read/common/net/address.dart';
import 'package:pure_read/page/eyepetizer/model/Issue_entity.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpFlutter {
  static Utf8Decoder utf8decoder = Utf8Decoder();
  static Map<String, String> httpHeader = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Connection': 'keep-alive',
    'Content-Type': 'application/json',
    'User-Agent':
        'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1',
  };

  static Future<String> getData(String url,
      {Function success, Function fail, Function complete}) async {
    try {
      var response = await http.get(url, headers: httpHeader);
      if (response.statusCode == 200) {
        success(response.body);
        return response.body;
      } else {
        throw Exception('"Request failed with status: ${response.statusCode}"');
      }
    } catch (e) {
      fail(e);
    } finally {
      if (complete != null) {
        complete();
      }
    }
  }

  static Future<String> getDatas(String url) async {
    var response = await http.get(url, headers: httpHeader);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception('"Request failed with status: ${response.statusCode}"');
    }
  }
}
