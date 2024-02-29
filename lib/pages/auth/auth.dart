import 'package:flok/services/auth.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _Authorization();
}

class _Authorization extends State<Authorization> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late String email;
  late String password;
  bool showLogin = true;

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {

    void loginUser() async{
      email = emailController.text;
      password = passwordController.text;

      if(email.isEmpty || password.isEmpty)
      {
        return;
      }

      AuthUser? user = await authService.signInWithEmailAndPassword(email.trim(), password.trim());
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
        emailController.clear();
        passwordController.clear();
      }
    }
    
    void registerUser() async{
      email = emailController.text;
      password = passwordController.text;

      if(email.isEmpty || password.isEmpty)
      {
        return;
      }

      AuthUser? user = await authService.registerWithEmailAndPassword(email.trim(), password.trim());
      if(user == null)
      {
        Fluttertoast.showToast(
        msg: "Не могу зарегистрировать вас",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
        );
      }
      else
      {
        emailController.clear();
        passwordController.clear();
      }
    }

    Widget text(Icon icon, String hint, TextEditingController controller, bool obsecure){
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 20),
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2)
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child:  IconTheme(
                data: const IconThemeData(color: Colors.black),
                child: icon,
              ),
            )
          ),
        )
      );
    }
    
    Widget field(String label, void Function() func){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: text(const Icon(Icons.login), 'Электронная почта', emailController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1, top: 20),
            child: text(const Icon(Icons.lock), 'Пароль', passwordController, true),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.only(bottom: 5, top: 1, left: 28),
            child: const Text('Минимальная длина пароля 6 символов', style: TextStyle(fontSize: 13))
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey[700], backgroundColor: Colors.grey[300], // foreground
                ),
                child: Text(label,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed:(){
                  func();
                },
              )
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 150),
            child: const Align(
              child: Text('КиноПоиск',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 100),
          (
            showLogin
            ? Column(
              children: [
                field('Войти', loginUser),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    child: const Text('Не зарегистрированы? Зарегистрируйтесь!'),
                    onTap:(){
                      setState((){
                        showLogin = false;
                      });
                    }
                  ),
                )
              ],
            )
            :Column(
              children: [
                field('Зарегистрироваться', registerUser),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    child: const Text('Уже зарегистрированы? Войдите!'),
                    onTap:(){
                      setState((){
                        showLogin = true;
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