import 'package:flutter/material.dart';

class Authorization extends StatefulWidget {
  Authorization({Key? key}) : super(key: key);

  @override
  _Authorization createState() => _Authorization();
}

class _Authorization extends State<Authorization> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _login;
  late String _password;
  bool ShowLogin = true;

  @override
  Widget build(BuildContext context) {

    void _loginUser(){
      _login = _loginController.text;
      _password = _passwordController.text;

      _loginController.clear();
      _passwordController.clear();
    }

    Widget _text(Icon icon, String hint, TextEditingController controller, bool obsecure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child:  IconTheme(
                data: IconThemeData(color: Colors.black),
                child: icon,
              ),
            )
          ),
        )
      );
    }
    
    Widget _field(String label, void func()){
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: _text(Icon(Icons.login), 'Логин', _loginController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: _text(Icon(Icons.lock), 'Пароль', _passwordController, true),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300], // background
                    onPrimary: Colors.grey[700], // foreground
                  ),
                  child: Text(label,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed:(){
                    func();
                  },
                )
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 150),
            child: Align(
              child: Text('КиноПоиск',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 100),
          (
            ShowLogin
            ? Column(
              children: [
                _field('Логин', _loginUser),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    child: Text('Не зарегистрированы? Зарегистрируйтесь!'),
                    onTap:(){
                      setState((){
                        ShowLogin = false;
                      });
                    }
                  ),
                )
              ],
            )
            :Column(
              children: [
                _field('Зарегистрироваться', _loginUser),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    child: Text('Уже зарегистрированы? Войдите!'),
                    onTap:(){
                      setState((){
                        ShowLogin = true;
                      });
                    }
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}