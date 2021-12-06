import 'package:auto_size_text/auto_size_text.dart';
import 'package:flok/components/constants.dart';
import 'package:flok/pages/details/bottom_description.dart';
import 'package:flutter/material.dart';


class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
          color: Colors.black,
        ),
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomDesription(),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: SizedBox(
                    height: 30,
                    child: AutoSizeText('Евангелион: Конец Евангелиона',
                      presetFontSizes: [40, 20, 14],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset('assets/images/eva.jpg',
                          width: cwidth,
                          height: cheight,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 34, left: 12),
                          child: Text('Год: '),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 34, left: 12),
                          child: Text('Время: '),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 34, left: 12),
                          child: Text('Страна: '),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 34, left: 12),
                          child: Text('Жанры: '),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: SizedBox(
                    height: 240,
                    width: 370,
                    child: AutoSizeText(
                      'Победив последнего Ангела, NERV сталкивается с более зловещей угрозой: пока Гэндо Икари начинает подготовку к Третьему удару, на их подземную штаб-квартиру нападают боевики Seele. Рэй сливается с Лилит, а Синдзи предстоит сделать выбор — продолжит человечество существование или нет.',
                    style: TextStyle(fontSize: 30),
                    minFontSize: 18,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}