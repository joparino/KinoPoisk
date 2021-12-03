import 'package:flok/pages/films.dart';
import 'package:flok/components/scroll_list.dart';
import 'package:flutter/material.dart';

bool _isPressed = false;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
              style: TextButton.styleFrom(
              primary: Colors.blueGrey[600],
              ),
              onPressed: () { 
                _isPressed = false;
                if(_isPressed == false)
                {
                  setState(() {
                    Container(child: Watched());
                  });
                }
              },
              child: Text('Просмотрено'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                primary: Colors.blueGrey[600],
                ),
                onPressed: () { 
                  if(_isPressed = true)
                  {
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> _Wwatched(),
                    ),);
                  }
                },
                child: Text('Буду смотреть'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                primary: Colors.blueGrey[600],
                ),
                onPressed: () { },
                child: Text('Любимые'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _Wwatched() => SingleChildScrollView(
    child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                List(image: 'assets/images/eva.jpg'),
                List(image: 'assets/images/arcane.jpg'),
                List(image: 'assets/images/iron_man.jpg'),
              ],
            ),
          ),
        ],
      ),
  );

}


class Watched extends StatelessWidget {
  const Watched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    List(image: 'assets/images/eva.jpg'),
                    List(image: 'assets/images/arcane.jpg'),
                    List(image: 'assets/images/iron_man.jpg'),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
