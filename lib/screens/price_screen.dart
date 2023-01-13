import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

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
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
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
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  double coinUSD;

  void updateUI(dynamic coinData) {
    setState(() {
      coinUSD = coinData['last'];
      print('USD = $coinUSD');
    });
  }

  Future update() async {
      var coinData = await coinModel.getCoinData();
      updateUI(coinData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    print('CoinUSD = $coinUSD');
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.amber,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $coinUSD USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.button.color),
                ),
              ),
            ),
          ),
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
