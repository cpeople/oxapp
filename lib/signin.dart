import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => new _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _mobile;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    Navigator.of(context).pushNamed('/profile_main');
    // final snackbar = new SnackBar(
    //   content: new Text("mobile : $_mobile, password : $_password"),
    // );
    // scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/backsign.png'),
                    fit: BoxFit.cover)),
            child: Container(
                child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 80),
                                    alignment: Alignment(0.0, 0.0),
                                    child: Image.asset(
                                      'assets/logo_ox.png',
                                      width: 150.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 40.0, left: 20.0, right: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      validator: (val) => val.length != 9
                                          ? 'Вы ввели не верный номер телефона'
                                          : null,
                                      onSaved: (String val) {
                                        _mobile = val;
                                      },
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
                                        prefix: Text('+998 '),
                                        labelText: 'НОМЕР ТЕЛЕФОНА',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white24)),
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFormField(
                                      validator: (val) => val.length < 6
                                          ? 'Короткий пароль'
                                          : null,
                                      onSaved: (val) => _password = val,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'ПАРОЛЬ',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white24)),
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      alignment: Alignment(1.0, 0.0),
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 20.0),
                                      child: InkWell(
                                        child: Text(
                                          'Забыли пароль?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto',
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      height: 60.0,
                                      child: Material(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        shadowColor: Colors.pinkAccent,
                                        color: Colors.pink,
                                        elevation: 7.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            _submit();
                                          },
                                          child: Center(
                                            child: Text(
                                              'ВОЙТИ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      height: 45.0,
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Center(
                                              child: ImageIcon(AssetImage(
                                                  'assets/facebook.png')),
                                            ),
                                            SizedBox(width: 5.0),
                                            Center(
                                              child: Text(
                                                  'Войти с помощью facebook',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto')),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'У Вас еще нет аккаунта ?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto'),
                                ),
                                SizedBox(width: 5.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/signup');
                                  },
                                  child: Text(
                                    'Зарегистрироваться',
                                    style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 60),
                          ],
                        ))))));
  }

  Type buildForm() => Form;
}
