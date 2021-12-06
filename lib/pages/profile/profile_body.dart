import 'package:flok/pages/profile/grid_view.dart';
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
            constraints: BoxConstraints.expand(height: 40),
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
                    margin: EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        mainAxisSpacing: 10,
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
                    margin: EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        mainAxisSpacing: 10,
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
                    margin: EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        mainAxisSpacing: 10,
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