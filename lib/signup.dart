import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white10,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text('РЕГИСТРАЦИЯ',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          )),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
        Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Номер телефона',
                      labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      prefix: Text('+998 '),
                      hintStyle: TextStyle(color: Colors.black26),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      suffixText: ('необязательно'),
                      suffixStyle: TextStyle(fontSize: 10, color: Colors.grey),
                      labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.black26),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Пароль',
                      labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.black26),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple))),
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ваше имя ',
                      labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.black26),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Реферальный код',
                      hintMaxLines: 10,
                      suffixText: ('необязательно'),
                      suffixStyle: TextStyle(fontSize: 10, color: Colors.grey),
                      labelStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.black26),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple))),
                ),
                SizedBox(height: 50.0),
                Container(
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      shadowColor: Colors.deepPurpleAccent,
                      color: Colors.deepPurple,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'ЗАРЕГИСТРИРОВАТЬСЯ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 50.0),
              ],
            )),
      ])),
    );
  }
}
