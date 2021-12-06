import 'package:flok/components/scroll_list.dart';
import 'package:flok/pages/film/title_film.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class bodyFilm extends StatelessWidget {
  const bodyFilm({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {

  Size size = MediaQuery.of(context).size;

  return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          title(Title: 'Фильмы',),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 14),
                child: Text('Популярно сейчас',
                style: TextStyle( 
                    color: Colors.blueGrey[300],
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
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
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 14, top: 10),
                child: Text('Скоро выйдет',
                style: TextStyle( 
                    color: Colors.blueGrey[300],
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
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
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 14, top: 10),
                child: Text('Топ 250 сериалов',
                style: TextStyle( 
                    color: Colors.blueGrey[300],
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
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
      )
    );
  }
}