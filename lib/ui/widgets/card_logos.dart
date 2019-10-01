import 'package:flutter/material.dart';

class CardLogosUrl extends StatelessWidget {
  final String _assetPath;
  CardLogosUrl(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15.0, left: 15.0),
          child: Image.asset(
            _assetPath,
            width: 65.0,
          ),
        ),
      ],
    );
  }
}
