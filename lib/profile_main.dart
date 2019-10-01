import 'package:flutter/material.dart';
import './ui/app.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(
        child: Text('Тут будет лента новостей',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            )),
      ),
      Center(
        child: Text('Тут будет кошелки',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            )),
      ),
      Center(child: CardMain()),
      Center(
        child: Text('Тут будет настройки',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            )),
      ),
    ];

    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.dashboard), title: Text('Лента')),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet), title: Text('Кошелек')),
      BottomNavigationBarItem(
          icon: Icon(Icons.credit_card), title: Text('Карты')),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text('Настройки')),
    ];

    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false, // <-- HERE
      showUnselectedLabels: false, // <-- AND HERE
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
