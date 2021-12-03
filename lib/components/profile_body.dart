import 'package:flok/components/grid_view.dart';
import 'package:flok/components/scroll_list.dart';
import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(tabs: [
              Tab(text: "Просмотрено"),
              Tab(text: "Желаемое"),
              Tab(text: "Любимое"),
            ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 3,left: 3),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 3,left: 3),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/arcane.jpg'),
                        GridWidget(image:'assets/images/arcane.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 3,left: 3),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/arcane.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                        GridWidget(image:'assets/images/eva.jpg'),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}