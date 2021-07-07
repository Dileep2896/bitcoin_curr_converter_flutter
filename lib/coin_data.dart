import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData({this.value, this.coinName});

  String value;
  String coinName;

  String url = "https://rest.coinapi.io/v1/exchangerate";
  String apiKey = "58B9DF10-D320-4447-B4A6-30D9E1A50A69";

  Future<int> getCoinData() async {
    Uri url = Uri.parse("${this.url}/$coinName/$value?apikey=$apiKey");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      double coinValue = body['rate'];
      return coinValue.toInt();
    } else {
      print(response.statusCode);
      return 0;
    }
  }
}
