import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String coinName;
  final double coin;
  final String selectedCurrency;

  CryptoCard({@required this.coinName, @required this.coin, @required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 $coinName = $coin $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).textTheme.button.color),
          ),
        ),
      ),
    );
  }
}
