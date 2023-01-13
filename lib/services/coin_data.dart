import 'package:bitcoin_ticker/services/network.dart';

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

const bitcoinAverageUrl = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD';

class CoinData {
  Future getCoinData() async {
    NetworkHelper networkHelper = NetworkHelper(bitcoinAverageUrl);
    var coinData = networkHelper.getData();

    return coinData;
  }
}

