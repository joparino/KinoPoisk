class FilmSearched {
    FilmSearched({
        required this.keyword,
        required this.films,
    });

    String? keyword;
    List<FilmS> films;

    factory FilmSearched.fromJson(Map<String, dynamic> json) => FilmSearched(
        keyword: json["keyword"] ?? '',
        films: List<FilmS>.from(json["films"].map((x) => FilmS.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "films": List<dynamic>.from(films.map((x) => x.toJson())),
    };
}

class FilmS {
    FilmS({
        required this.filmId,
        required this.posterUrlPreview,
    });

    int filmId;
    String posterUrlPreview;

    factory FilmS.fromJson(Map<String, dynamic> json) => FilmS(
        filmId: json["filmId"],
        posterUrlPreview: json["posterUrlPreview"],
    );

    Map<String, dynamic> toJson() => {
        "filmId": filmId,
        "posterUrlPreview": posterUrlPreview,
    };
}