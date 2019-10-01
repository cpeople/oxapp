import 'package:flutter/material.dart';
import '../../models/card_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../blocs/card_list_bloc.dart';
import 'card_logos.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardResults>>(
      stream: cardListBloc.cardList,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            !snapshot.hasData
                ? CircularProgressIndicator()
                : SizedBox(
                    height: 410,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return CardFrontList(
                          cardModel: snapshot.data[index],
                        );
                      },
                      itemCount: snapshot.data.length,
                      itemWidth: 310,
                      itemHeight: 200,
                      layout: SwiperLayout.STACK,
                      scrollDirection: Axis.vertical,
                    ))
          ],
        );
      },
    );
  }
}

class CardFrontList extends StatelessWidget {
  final CardResults cardModel;
  CardFrontList({this.cardModel});

  @override
  Widget build(BuildContext context) {
    final _cardNumber = Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildDots(),
        ],
      ),
    );

    // final _cardLastNumber = Padding(
    //   padding: const EdgeInsets.only(top: 1.0, left: 55.0),
    //   child: Text(
    //     cardModel.cardNumber.substring(12),
    //     style: TextStyle(color: Colors.white, fontSize: 8.0),
    //   ),
    // );

    final _cardValidThru = Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '${cardModel.cardMonth}/${cardModel.cardYear.substring(2)}',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ],
        ));

    final _cardOwner = Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15.0),
      child: Text(
        cardModel.cardHolderName,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );

    final _cardAmount = Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 15.0),
      child: Text(
        cardModel.cardAmount == null ? '0' : cardModel.cardAmount,
        style: TextStyle(color: Colors.white, fontSize: 34.0),
      ),
    );

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: cardModel.cardColor,
        ),
        child: RotatedBox(
          quarterTurns: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardLogosUrl(cardModel.cardType == 'UZCARD'
                  ? 'assets/uzcard.png'
                  : 'assets/visa_logo.png'),
              //   _cardLastNumber,
              _cardOwner,
              _cardAmount,
              _cardNumber,
              _cardValidThru,
            ],
          ),
        ));
  }

  Widget _buildDots() {
    List<Widget> dotList = new List<Widget>();
    var counter = 0;
    for (var i = 0; i < 12; i++) {
      counter += 1;
      dotList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Container(
            width: 6.5,
            height: 6.5,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
      if (counter == 4) {
        counter = 0;
        dotList.add(SizedBox(width: 40.0));
      }
    }
    dotList.add(_buildNumbers());
    return Row(children: dotList);
  }

  Widget _buildNumbers() {
    return Text(
      cardModel.cardNumber.substring(12),
      style: TextStyle(color: Colors.white),
    );
  }
}
