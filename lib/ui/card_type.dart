import 'package:flutter/material.dart';
import '../ui/widgets/my_appbar.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/card_bloc.dart';
import '../ui/card_create.dart';

class CardType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _buildTextInfo = Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child: Text.rich(
        TextSpan(
            text:
                'Платежи по пластиковым картам UzCard обрабатываются через процессенговый центр.  Данные, введенные Вами в платежную форму полностю защищены в соответствии с требованиями стандарта безопасности. Никто, в том числе продовец, не может получить персональные и банковские данные клиента. Мы получем информацию только о совершенном Вами платеже ',
            style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
            children: <TextSpan>[
              TextSpan(
                  text: 'Подробнее',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.w400))
            ]),
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
        appBar: MyAppBar(
            appBarTitle: 'Выберите тип карты',
            leadingIcon: Icons.clear,
            context: context),
        body: Container(
            padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildRaisedButton(
                    buttonColor: Colors.lightBlue,
                    buttonText: 'UzCard',
                    textColor: Colors.white,
                    context: context),
                _buildRaisedButton(
                    buttonColor: Colors.grey[100],
                    buttonText: 'Humo Card',
                    textColor: Colors.grey[600],
                    context: context),
                _buildRaisedButton(
                    buttonColor: Colors.grey[100],
                    buttonText: 'Visa Card',
                    textColor: Colors.grey[600],
                    context: context),
                _buildTextInfo,
              ],
            )));
  }

  Widget _buildRaisedButton(
      {Color buttonColor,
      String buttonText,
      Color textColor,
      BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: RaisedButton(
        elevation: 1.0,
        onPressed: () {
          var blocProviderCardCreate = BlocProvider(
            bloc: CardBloc(),
            child: CardCreate(),
          );
          blocProviderCardCreate.bloc.selectCardType(buttonText);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => blocProviderCardCreate));
        },
        color: buttonColor,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
