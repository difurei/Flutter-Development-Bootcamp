import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../widgets/CryptoCard.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String androidSelectedCurrency = currenciesList[0];
  int iOSSelectedIndex = 0;
  String iOSSelectedCurrency = currenciesList[0];

  CoinData coinModel = CoinData();

  DropdownButton<String> androidDropdownMenu() {
    List<DropdownMenuItem<String>> dropdownMenuItemList = [];

    for (String item in currenciesList) {
      dropdownMenuItemList
          .add(DropdownMenuItem(child: Text(item, style: TextStyle(color: Colors.black),), value: item));
    }

    return DropdownButton<String>(
        value: androidSelectedCurrency,
        items: dropdownMenuItemList,
        onChanged: (value) async {
          setState(() {
            androidSelectedCurrency = value;
            androidUpdate();
          });
        });
  }

  CupertinoPicker IOSPicker() {
    List<Text> pickerItems = [];
    List<String> stringPickerItems = [];

    for (String item in currenciesList) {
      pickerItems.add(Text(item));
      stringPickerItems.add(item);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        setState(() {
          iOSSelectedIndex = selectedIndex;
          iOSSelectedCurrency = stringPickerItems[iOSSelectedIndex];
          iOSUpdate();
        });
      },
      children: pickerItems,
    );
  }

  double coin;
  double btc;
  double eth;
  double ltc;

  double updateCoin(dynamic coinData) {
    setState(() {
      coin = coinData['last'];
    });
    return coin;
  }

  Future androidUpdate() async {
    var coinBTC =
        await coinModel.getCoinData(cryptoList[0], androidSelectedCurrency);
    var coinETH =
        await coinModel.getCoinData(cryptoList[1], androidSelectedCurrency);
    var coinLTC =
        await coinModel.getCoinData(cryptoList[2], androidSelectedCurrency);
    btc = updateCoin(coinBTC);
    eth = updateCoin(coinETH);
    ltc = updateCoin(coinLTC);
  }

  Future iOSUpdate() async {
    var coinBTC =
        await coinModel.getCoinData(cryptoList[0], iOSSelectedCurrency);
    var coinETH =
        await coinModel.getCoinData(cryptoList[1], iOSSelectedCurrency);
    var coinLTC =
        await coinModel.getCoinData(cryptoList[2], iOSSelectedCurrency);
    btc = updateCoin(coinBTC);
    eth = updateCoin(coinETH);
    ltc = updateCoin(coinLTC);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    androidUpdate();
    iOSUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async => Platform.isIOS ? iOSUpdate() : androidUpdate(),
          icon: Icon(Icons.restart_alt),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(
              coinName: '${cryptoList[0]}',
              coin: btc,
              selectedCurrency: Platform.isIOS
                  ? iOSSelectedCurrency
                  : androidSelectedCurrency),
          CryptoCard(
              coinName: '${cryptoList[1]}',
              coin: eth,
              selectedCurrency: Platform.isIOS
                  ? iOSSelectedCurrency
                  : androidSelectedCurrency),
          CryptoCard(
              coinName: '${cryptoList[2]}',
              coin: ltc,
              selectedCurrency: Platform.isIOS
                  ? iOSSelectedCurrency
                  : androidSelectedCurrency),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.amber,
            child: Platform.isIOS ? IOSPicker() : androidDropdownMenu(),
          ),
        ],
      ),
    );
  }
}
