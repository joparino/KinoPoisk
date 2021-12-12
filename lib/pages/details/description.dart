import 'package:auto_size_text/auto_size_text.dart';
import 'package:flok/components/constants.dart';
import 'package:flok/model/details_film.dart';
import 'package:flok/pages/details/bottom_description.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';


class DescriptionPage extends StatefulWidget {
  final int filmId;
  const DescriptionPage(this.filmId, {Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

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
        child: FutureBuilder<DetailsFilm>(
          future: FilmsApi.getDetailsFilm(widget.filmId),
          builder: (context, snapshot) {

            if(!snapshot.hasData)
              {
                return const Center(child: CircularProgressIndicator());
              }

            final details = snapshot.data;
            final genresLength = details!.genres.length;

            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: SizedBox(
                        height: 30,
                        child: AutoSizeText(details.nameRu,
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
                          margin: const EdgeInsets.only(top: 2, left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(details.posterUrlPreview,
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
                              child: Text('Год: ' + details.year.toString()),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 34, left: 12),
                              child: Text('Время: ' + details.filmLength.toString()),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 34, left: 12),
                              child: SizedBox(
                                width: 70,
                                child: AutoSizeText('Жанр: ${details.genres[genresLength].genre}')
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 34, left: 12),
                              child: SizedBox(
                                width: 70,
                                child: AutoSizeText('Жанр: ${details.genres[genresLength].genre}')
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 34, left: 12),
                              child: SizedBox(
                                width: 70,
                                child: AutoSizeText('Страна: ' + details.countries[0].country)
                                ),
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
                          '',
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
            );
          }
        ),
      ),
    );
  }
}