import 'package:auto_size_text/auto_size_text.dart';
import 'package:flok/components/constants.dart';
import 'package:flok/model/details_film.dart';
import 'package:flok/request/request.dart';
import 'package:flok/services/database.dart';
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
      body: SingleChildScrollView(
        child: FutureBuilder<DetailsFilm>(
            future: FilmsApi.getDetailsFilm(widget.filmId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final details = snapshot.data;
              final genresLength = details!.genres.length;
              final listGenre = details.genres;
              final listCountry = details.countries;
              final countriesLength = details.countries.length;

              Widget getTextGenres(List<Genre> listGenre) {
                String listGenres = "";
                for (var i = 0; i < genresLength; i++) {
                  if (genresLength == 1) {
                    listGenres += details.genres[0].genre;
                    return AutoSizeText('Жанр: $listGenres');
                  }
                  if (i == genresLength - 1) {
                    listGenres += details.genres[i].genre;
                    break;
                  }
                  listGenres += details.genres[i].genre + ", ";
                }
                return AutoSizeText('Жанры: $listGenres');
              }

              Widget getTextCountries(List<Countrys> listCountry) {
                String listCountries = "";
                for (var i = 0; i < countriesLength; i++) {
                  if (countriesLength == 1) {
                    listCountries += details.countries[0].country;
                    return AutoSizeText('Страна: $listCountries');
                  }
                  if (i == countriesLength - 1) {
                    listCountries += details.countries[i].country;
                    break;
                  }
                  listCountries += details.countries[i].country + ", ";
                }
                return AutoSizeText('Страны: $listCountries');
              }

              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: SizedBox(
                            width: 370,
                            child: AutoSizeText(
                              details.nameRu,
                              style: TextStyle(fontSize: 28),
                              stepGranularity: 2,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 2, left: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image.network(
                                details.posterUrlPreview,
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
                                margin: EdgeInsets.only(top: 20, left: 12),
                                child: Text(
                                    'Время: ' + details.filmLength.toString()),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 12),
                                child: SizedBox(
                                    width: 178,
                                    height: 50,
                                    child: getTextGenres(listGenre)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20,left: 12),
                                child: SizedBox(
                                    width: 178,
                                    height: 50,
                                    child: getTextCountries(listCountry)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 140,
                            height: 40,
                            padding: const EdgeInsets.only(
                                left: 14, top: 4, right: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[300], // background
                                onPrimary: Colors.grey[700], // foreground
                              ),
                              onPressed: () {
                                DatabaseService().addFilmIsWatched(details);
                              },
                              child: Text('Посмотрел'),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 40,
                            padding: const EdgeInsets.only(
                                top: 4, right: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[300], // background
                                onPrimary: Colors.grey[700], // foreground
                              ),
                              onPressed: () {
                                DatabaseService().addFilmIsWanted(details);
                              },
                              child: Text('Посмотрю'),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            padding: const EdgeInsets.only(top: 4, right: 14),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[300], // background
                                onPrimary: Colors.grey[700], // foreground
                              ),
                              onPressed: () {
                                DatabaseService().addFilmIsLiked(details);
                              },
                              child: Text('Любимое'),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                        child: AutoSizeText(
                          details.description,
                          style: TextStyle(fontSize: 24),
                          stepGranularity: 4,
                          maxLines: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
