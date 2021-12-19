import 'package:flok/services/auth.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authorization extends StatefulWidget {
  Authorization({Key? key}) : super(key: key);

  @override
  _Authorization createState() => _Authorization();
}

class _Authorization extends State<Authorization> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
  bool ShowLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    void _loginUser() async{
      _email = _emailController.text;
      _password = _passwordController.text;

      if(_email.isEmpty || _password.isEmpty)
      {
        return;
      }

      AuthUser? user = await _authService.signInWithEmailAndPassword(_email.trim(), _password.trim());
      if(user == null)
      {
        Fluttertoast.showToast(
        msg: "Ошибка в пароле или email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
      }
      else
      {
        _emailController.clear();
        _passwordController.clear();
      }
    }
    
    void _registerUser() async{
      _email = _emailController.text;
      _password = _passwordController.text;

      if(_email.isEmpty || _password.isEmpty)
      {
        return;
      }

      AuthUser? user = await _authService.registerWithEmailAndPassword(_email.trim(), _password.trim());
      if(user == null)
      {
        Fluttertoast.showToast(
        msg: "Не могу зарегистрировать вас",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
      }
      else
      {
        _emailController.clear();
        _passwordController.clear();
      }
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
              child: _text(Icon(Icons.login), 'Логин', _emailController, false),
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
                _field('Зарегистрироваться', _registerUser),
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