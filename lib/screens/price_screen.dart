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
  String selectedCurrency = currenciesList[0];

  CoinData coinModel = CoinData();

  DropdownButton<String> androidDropdownMenu() {
    List<DropdownMenuItem<String>> dropdownMenuItemList = [];

    for (String item in currenciesList) {
      dropdownMenuItemList
          .add(DropdownMenuItem(child: Text(item), value: item));
    }

    return DropdownButton<String>(
      onTap: () {},
        value: selectedCurrency,
        items: dropdownMenuItemList,
        onChanged: (value) async{
          setState(() {
            selectedCurrency = value;
            update();
          });
        });
  }

  CupertinoPicker IOSPicker() {
    List<Text> pickerItems = [];

    for (String item in currenciesList) {
      pickerItems.add(Text(item));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async{
        print(selectedIndex);
        update();
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

  Future update() async {
      var coinBTC = await coinModel.getCoinData(cryptoList[0], selectedCurrency);
      var coinETH = await coinModel.getCoinData(cryptoList[1], selectedCurrency);
      var coinLTC = await coinModel.getCoinData(cryptoList[2], selectedCurrency);
      btc = updateCoin(coinBTC);
      eth = updateCoin(coinETH);
      ltc = updateCoin(coinLTC);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
        leading: IconButton(onPressed: () async => update(), icon: Icon(Icons.restart_alt),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(coinName: '${cryptoList[0]}', coin: btc, selectedCurrency: selectedCurrency),
          CryptoCard(coinName: '${cryptoList[1]}', coin: eth, selectedCurrency: selectedCurrency),
          CryptoCard(coinName: '${cryptoList[2]}', coin: ltc, selectedCurrency: selectedCurrency),
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
